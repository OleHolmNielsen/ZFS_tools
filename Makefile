scripts=zfsdefaultquota zfs_over_quota zfsrepquota zfssetquota

install:
	/usr/bin/install --owner root --group root ${scripts} /usr/local/sbin/
