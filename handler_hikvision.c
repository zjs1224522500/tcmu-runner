/*
 * Copyright (c) 2014 Red Hat, Inc.
 *
 * This file is licensed to you under your choice of the GNU Lesser
 * General Public License, version 2.1 or any later version (LGPLv2.1 or
 * later), or the Apache License 2.0.
 */

/*
 * Example code to demonstrate how a TCMU handler might work.
 *
 * Using the example of backing a device by a file to demonstrate:
 *
 * 1) Registering with tcmu-runner
 * 2) Parsing the handler-specific config string as needed for setup
 * 3) Opening resources as needed
 * 4) Handling SCSI commands and using the handler API
 */

#define _GNU_SOURCE
#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <endian.h>
#include <errno.h>
#include <scsi/scsi.h>

#include "scsi_defs.h"
#include "libtcmu.h"
#include "tcmu-runner.h"
#include "tcmur_device.h"

struct hikvision_state {
	char *iqn;
	int fd;
	double fragment_size;
    char *fragment_size_unit;
};

static int hikvision_open(struct tcmu_device *dev, bool reopen)
{
	struct hikvision_state *state;
	char *cfgString, *first_virgule_symbol, *second_virgule_symbol, *semicolon_symbol, *file_desc_path, *iqn, *fragment_size_str;
	int length, file_path_length, fragment_size_length;
	struct hikvision_state *hm_private;

	state = calloc(1, sizeof(*state));
	if (!state) 
	{
		return -ENOMEM;
	}
	tcmur_dev_set_private(dev, state);

	// Parse the config string to iqn and file desc.
	cfgString = tcmu_dev_get_cfgstring(dev);
	first_virgule_symbol = strchr(cfgString, '/');
	semicolon_symbol = strchr(cfgString, ';');
	fragment_size_str = semicolon_symbol + 1;
	fragment_size_length = strlen(fragment_size_str);
	file_path_length = semicolon_symbol - first_virgule_symbol - 1;
	file_desc_path = (char *) calloc(file_path_length, sizeof(char));
	strncpy(file_desc_path, first_virgule_symbol + 1, file_path_length);

	state->fd = open(file_desc_path, O_CREAT | O_RDWR, S_IRUSR | S_IWUSR);
	if (state->fd == -1) {
		tcmu_err("could not open %s: %m\n", file_desc_path);
		goto err;
	}
	second_virgule_symbol = strchr(file_desc_path + 1, '/');
	if (!second_virgule_symbol) {
		tcmu_err("no configuration found in cfgstring\n");
		goto err;
	}
	length = second_virgule_symbol - file_desc_path - 1;
    iqn = (char *) calloc(length, sizeof(char));
    strncpy(iqn, file_desc_path + 1, length);
	state->iqn = strcat(iqn, "\0");
    state->fragment_size = strtod(fragment_size_str, &state->fragment_size_unit);

	// Enable the write cache.
 	tcmu_dev_set_write_cache_enabled(dev, 1);

	// TODO: Test the hikivision object storage

	tcmu_err("config string %s\n", tcmu_dev_get_cfgstring(dev));
	tcmu_err("iqn of state: %s\n", state->iqn);
	tcmu_err("fd of state: %d\n", state->fd);
	tcmu_err("fragment size : %lf\n", state -> fragment_size);
	tcmu_err("fragment size unit : %s\n", state -> fragment_size_unit);

	hm_private = tcmur_dev_get_private(dev);
	tcmu_err("iqn of hm_private: %s\n", hm_private->iqn);
	tcmu_err("fd of state: %d\n", hm_private->fd);
	tcmu_err("fragment size : %lf\n", hm_private -> fragment_size);
	tcmu_err("fragment size unit : %s\n", hm_private -> fragment_size_unit);
	return 0;

err:
	free(state);
	return -EINVAL;
}

static void hikvision_close(struct tcmu_device *dev)
{
	// Get the file state of tcmu_device.
	struct hikvision_state *state = tcmur_dev_get_private(dev);
	
	// Close the file
	close(state->fd);

	// free(state);
	free(state);
}

/**
 * 
 * @param *dev              tcmu device
 * @param *cmd              Command line interface.(not used in this method)
 * @param *iov              buffer array to syore the data
 * @param iov_cnt           buffer array size  
 * @param length            read length
 * @param offset            start address
 * 
 * return                   the size of read data.
 */
static int hikvision_read(struct tcmu_device *dev, struct tcmulib_cmd *cmd,
		     struct iovec *iov, size_t iov_cnt, size_t length,
		     off_t offset)
{
	struct hikvision_state *tcmur_state = tcmur_dev_get_private(dev);
	size_t remaining = length;
	ssize_t ret;
	
	char *iqn = tcmur_state->iqn;
	tcmu_err("read with iqn(tcmur): %s\n", iqn);
	tcmu_err("read with fd(tcmur): %d\n", tcmur_state->fd);
	tcmu_err("read with fragment size : %lf\n", tcmur_state -> fragment_size);
	tcmu_err("read with fragment size unit : %s\n", tcmur_state -> fragment_size_unit);

    // Read the file in loop
	while (remaining) {
		// Read the data and store in the iov array. Return the data size.
		ret = preadv(tcmur_state->fd, iov, iov_cnt, offset);
		if (ret < 0) {
			tcmu_err("read failed: %m\n");
			ret = TCMU_STS_RD_ERR;
			goto done;
		}

		if (ret == 0) {
			/* EOF, then zeros the iovecs left */
			tcmu_iovec_zero(iov, iov_cnt);
			break;
		}

        // Consume the iov array. 
		tcmu_iovec_seek(iov, ret);
		// Move the offset
		offset += ret;
		// Change the length and continute to read file.
		remaining -= ret;
	}
	// Read finished, and status is OK.
	ret = TCMU_STS_OK;
done:
	return ret;
}

/**
 * 
 * @param *dev              tcmu device
 * @param *cmd              Command line interface.(not used in this method)
 * @param *iov              buffer array to syore the data
 * @param iov_cnt           buffer array size  
 * @param length            write length
 * @param offset            start address
 * 
 * return                   the size of read data.
 */
static int hikvision_write(struct tcmu_device *dev, struct tcmulib_cmd *cmd,
		      struct iovec *iov, size_t iov_cnt, size_t length,
		      off_t offset)
{
	struct hikvision_state *tcmur_state = tcmur_dev_get_private(dev);
	
    size_t remaining = length;
	ssize_t ret;

	char *iqn = tcmur_state->iqn;
	tcmu_err("write with iqn(tcmur): %s\n", iqn);
	tcmu_err("write with fd(tcmur): %d\n", tcmur_state->fd);
	tcmu_err("write with fragment size : %lf\n", tcmur_state -> fragment_size);
	tcmu_err("write with fragment size unit : %s\n", tcmur_state -> fragment_size_unit);

    // Write the file in loop
	while (remaining) {
	    // Wirte the data in the iov array to file. Return the data size.
		ret = pwritev(tcmur_state->fd, iov, iov_cnt, offset);
		if (ret < 0) {
			tcmu_err("write failed: %m\n");
			ret = TCMU_STS_WR_ERR;
			goto done;
		}
		// Consume an inv array.
		tcmu_iovec_seek(iov, ret);
		// Move the offset.
		offset += ret;
		// Change the length and continue to write.
		remaining -= ret;
	}
	ret = TCMU_STS_OK;
done:
	return ret;
}

static int hikvision_flush(struct tcmu_device *dev, struct tcmulib_cmd *cmd)
{
	// Get the file state of tcmu_device.
	struct hikvision_state *state = tcmur_dev_get_private(dev);
	int ret;

	// Sync(Flush) the data in page cache to disk.
	if (fsync(state->fd)) {
		tcmu_err("sync failed\n");
		ret = TCMU_STS_WR_ERR;
		goto done;
	}
	ret = TCMU_STS_OK;
done:
	return ret;
}

static int hikvision_reconfig(struct tcmu_device *dev, struct tcmulib_cfg_info *cfg)
{
	switch (cfg->type) {
	// Extend or Reduce the size of file.
	case TCMULIB_CFG_DEV_SIZE:
		/*
		 * TODO - For open/reconfig we should make sure the FS the
		 * file is on is large enough for the requested size. For
		 * now assume we can grow the file and return 0.
		 */
		return 0;
	case TCMULIB_CFG_DEV_CFGSTR:
	// Handle the write cache.
	case TCMULIB_CFG_WRITE_CACHE:
	default:
		return -EOPNOTSUPP;
	}
}

static const char hikvision_cfg_desc[] =
	"The format of config string should be 'iqn/lun-name'.";

// Init the tcmu_handler with given static method defined in this class.
static struct tcmur_handler hikvision_handler = {
	.cfg_desc = hikvision_cfg_desc,

	.reconfig = hikvision_reconfig,

	.open = hikvision_open,
	.close = hikvision_close,
	.read = hikvision_read,
	.write = hikvision_write,
	.flush = hikvision_flush,
	.name = "HikVison-Object-Storage-backed Handler",
	.subtype = "Hikvision_Block",
	.nr_threads = 2,
};

/* Entry point must be named "handler_init". */
int handler_init(void)
{
	// Regist the hikvision_handler to running_handler list
	return tcmur_register_handler(&hikvision_handler);
}
