
# This is temporary fix for absence of `common` script
# which is required by uboot-script-gen.
# This code need to be placed into original recipe for
# proper fix.
do_deploy:append:class-native() {
	install -d ${DEPLOYDIR}
	install -m 0755 ${S}/scripts/common ${DEPLOYDIR}/
}
