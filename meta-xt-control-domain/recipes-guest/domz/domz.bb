SUMMARY = "Set of files to run a Zephyr-based guest "
DESCRIPTION = "A config file and binary for a guest domain with Zephyr OS"

PV = "0.1"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

EXTERNALSRC_SYMLINKS = ""

SRC_URI = "\
    file://${XT_DOMZ_CONFIG_NAME} \
"

FILES_${PN} = " \
    ${sysconfdir}/xen/domz.cfg \
    ${libdir}/xen/boot/zephyr-domz \
"

do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install() {
    install -d ${D}${sysconfdir}/xen
    install -m 0644 ${WORKDIR}/${XT_DOMZ_CONFIG_NAME} ${D}${sysconfdir}/xen/domz.cfg
    # EXTERNALSRC_pn_domz is provided in moulin.cfg
    install -d ${D}${libdir}/xen/boot
    install -m 0644 ${EXTERNALSRC}/zephyr.bin ${D}${libdir}/xen/boot/zephyr-domz
}
