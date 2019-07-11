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

struct file_state {
	int fd;
};

static int file_open(struct tcmu_device *dev, bool reopen)
{
	struct file_state *state;
	char *config;

	state = calloc(1, sizeof(*state));
	if (!state)
		return -ENOMEM;

    // Init the file state of tcmu
	tcmur_dev_set_private(dev, state);

    // Move the pointer to the first '/' location in path string
	config = strchr(tcmu_dev_get_cfgstring(dev), '/');
	if (!config) {
		tcmu_err("no configuration found in cfgstring\n");
		goto err;
	}
	config += 1; /* get past '/' */

    // Enable the tcmu write cache.(Set the value of tcmu_device as true)
	tcmu_dev_set_write_cache_enabled(dev, 1);

    // Open the file with path.(With mode)
	state->fd = open(config, O_CREAT | O_RDWR, S_IRUSR | S_IWUSR);
	if (state->fd == -1) {
		tcmu_err("could not open %s: %m\n", config);
		goto err;
	}

	tcmu_dbg("config %s\n", tcmu_dev_get_cfgstring(dev));

	return 0;

err:
	free(state);
	return -EINVAL;
}

static void file_close(struct tcmu_device *dev)
{
	// Get the file state of tcmu_device.
	struct file_state *state = tcmur_dev_get_private(dev);

    // Close the file
	close(state->fd);

	// free the state
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
static int file_read(struct tcmu_device *dev, struct tcmulib_cmd *cmd,
		     struct iovec *iov, size_t iov_cnt, size_t length,
		     off_t offset)
{
	// Get the file state of tecmu_device
	struct file_state *state = tcmur_dev_get_private(dev);
	size_t remaining = length;
	ssize_t ret;

    // Read the file in loop
	while (remaining) {
		// Read the data and store in the iov array. Return the data size.
		ret = preadv(state->fd, iov, iov_cnt, offset);
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
static int file_write(struct tcmu_device *dev, struct tcmulib_cmd *cmd,
		      struct iovec *iov, size_t iov_cnt, size_t length,
		      off_t offset)
{
	// Get the file state of tecmu_device
	struct file_state *state = tcmur_dev_get_private(dev);
	size_t remaining = length;
	ssize_t ret;

    // Write the file in loop
	while (remaining) {
	    // Wirte the data in the iov array to file. Return the data size.
		ret = pwritev(state->fd, iov, iov_cnt, offset);
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

static int file_flush(struct tcmu_device *dev, struct tcmulib_cmd *cmd)
{
	struct file_state *state = tcmur_dev_get_private(dev);
	int ret;

	if (fsync(state->fd)) {
		tcmu_err("sync failed\n");
		ret = TCMU_STS_WR_ERR;
		goto done;
	}
	ret = TCMU_STS_OK;
done:
	return ret;
}

static int file_reconfig(struct tcmu_device *dev, struct tcmulib_cfg_info *cfg)
{
	switch (cfg->type) {
	case TCMULIB_CFG_DEV_SIZE:
		/*
		 * TODO - For open/reconfig we should make sure the FS the
		 * file is on is large enough for the requested size. For
		 * now assume we can grow the file and return 0.
		 */
		return 0;
	case TCMULIB_CFG_DEV_CFGSTR:
	case TCMULIB_CFG_WRITE_CACHE:
	default:
		return -EOPNOTSUPP;
	}
}

static const char file_cfg_desc[] =
	"The path to the file to use as a backstore.";

// Init the tcmu_handler with given static method defined in this class.
static struct tcmur_handler file_handler = {
	.cfg_desc = file_cfg_desc,

	.reconfig = file_reconfig,

	.open = file_open,
	.close = file_close,
	.read = file_read,
	.write = file_write,
	.flush = file_flush,
	.name = "File-backed Handler (example code)",
	.subtype = "file",
	.nr_threads = 2,
};

/* Entry point must be named "handler_init". */
int handler_init(void)
{
	// Regist the file_handler to running_handler list
	return tcmur_register_handler(&file_handler);
}
