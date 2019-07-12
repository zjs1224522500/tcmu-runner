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

struct hikivision_state {
	char *iqn;
}

static int hikvision_open(struct tcmu_device *dev, bool reopen)
{
	struct hikvision_state *state;
	state = calloc(1, sizeof(*state));
	if (!state)
		return -ENOMEM;
	tcmur_dev_set_private(dev, state);
 	tcmu_dev_set_write_cache_enabled(dev, 1);

	// TODO: Test the hikivision object storage

	// TODO: Set the iqn to struct hikvision state
	
	return 0;

err:
	free(state);
	return -EINVAL;
}

static void hikvision_close(struct tcmu_device *dev)
{
	// // Get the file state of tcmu_device.
	// struct file_state *state = tcmur_dev_get_private(dev);
	
    // // Close the file
	// close(state->fd);

	// // free the state
	// free(state);
	struct hikvision_state *state = tcmur_dev_get_private(dev);
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
	
	return 0;
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
	
}

static int hikvision_flush(struct tcmu_device *dev, struct tcmulib_cmd *cmd)
{
	
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
	"The path to the file to use as a backstore.";

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
