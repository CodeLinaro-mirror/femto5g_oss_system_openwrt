#!/bin/sh

# Copyright (c) 2023 Qualcomm Technologies, Inc.
# All Rights Reserved.
# Confidential and Proprietary - Qualcomm Technologies, Inc.

if [ "$1" = "fastpath" ]; then
	echo "Configuring IPsec Fast Path via NSS" > /dev/kmsg
	insmod /lib/modules/5.4.213/qca-nss-eip-ipsec.ko
elif [ "$1" = "slowpath" ]; then
	echo "Configuring IPsec Slow Path via Linux" > /dev/kmsg
else
	echo "Wrong input: "$1" IPsec tunnel creation failed"
	echo "Usage:"
	echo "1. start_ipsec.sh slowpath (Linux based)"
	echo "2. start_ipsec.sh fastpath (NSS based)"
	exit 0
fi;

# Initiate the IPsec tunnel creation.
/etc/init.d/swanctl restart
