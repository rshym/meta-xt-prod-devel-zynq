# Workaround for "Multiarch not setup properly."
#
# Folowing workaround is based on
# ---
# From 9be8f66933b2cd0d628eb519cb258b71c6e2869d Mon Sep 17 00:00:00 2001
# From: Vikram Garhwal <vikram.garhwal@amd.com>
# Date: Mon, 7 Nov 2022 21:04:44 -0800
# Subject: [PATCH] Fix for xen-image-minimal
# ---
# For details see
# https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1696137838/Building+Xen+Hypervisor+through+Yocto+Flow
# Item 11 of section "Diagnosing Xen Build issue"
deltask do_write_xen_qemuboot_dtb
