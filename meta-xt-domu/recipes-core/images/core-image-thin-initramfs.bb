# Simple initramfs image. Mostly used for live images.
DESCRIPTION = "Generic image with RAM-based Initial Root Filesystem \
(initramfs) is used to avoid need for accessing block/mtd devices."

IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"

IMAGE_LINGUAS = ""

LICENSE = "MIT"

IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"

inherit core-image

BAD_RECOMMENDATIONS += "busybox-syslog"

IMAGE_ROOTFS_SIZE ?= "8192"
