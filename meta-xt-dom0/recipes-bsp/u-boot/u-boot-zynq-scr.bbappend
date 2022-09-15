FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = " \
    file://xen_uboot.cfg \
"

# some tools from DTC are used by uboot-script-gen
# also u-boot-mkimage is used but it is specified in main recipe
DEPENDS_append = " dtc-native"

do_compile_append() {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'true', 'false', d)}; then
        #${DEPLOY_DIR_IMAGE}/uboot-script-gen -c "${WORKDIR}/xen_uboot.cfg" -d "${DEPLOY_DIR_IMAGE}" -t "load mmc 0:1" -o "${B}/boot_xen"
        mkimage -A arm -T script -C none -n "Boot script" -d "${WORKDIR}/xen_uboot.cfg" boot_xen.scr
    fi
}

do_deploy_append() {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'true', 'false', d)}; then
        install -d ${DEPLOYDIR}
        install -m 0644 boot_xen.scr ${DEPLOYDIR}/boot_xen.scr
    fi
}

