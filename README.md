About the ZFS filesystem
=============================

The [ZFS][1] filesystem is an alternative to [XFS][5].
While introduced originally in the [Solaris][4] OS,
[ZFS][1] has been ported to [ZFS_on_Linux][2].
See also the [OpenZFS][3] developers page.

Furthermore, we have written a quick [guide for configuring ZFS][6].

[1]: https://en.wikipedia.org/wiki/ZFS
[2]: https://zfsonlinux.org/
[3]: https://openzfs.org/wiki/Main_Page
[4]: https://en.wikipedia.org/wiki/Oracle_Solaris
[5]: https://en.wikipedia.org/wiki/XFS
[6]: https://wiki.fysik.dtu.dk/ITwiki/ZFS_filesystems/

Tools for the ZFS filesystem
=============================

The files in the present repository augment the tools provided by the
[ZFS][1] software stack.
Mainly lacking are tools for handling **user disk quotas**.

We provide the following scripts for checking ZFS user quotas by the **root user only**:

1. [zfsrepquota](zfsrepquota) Report ZFS disk quotas,
   use ``-u username`` to limit to a single user.

2. [zfsdefaultquota](zfsdefaultquota) Set default quotas for all users in a filesystem

3. [zfssetquota](zfssetquota) Set quotas for one or more users in a filesystem

4. [zfs_over_quota](zfs_over_quota) Send E-mail alerts from the file server to users who are getting close to their quota limit.

Copy these scripts to the /usr/local/sbin/ folder.
The [Makefile](Makefile) will install the scripts.

Periodic reports can be sent by a crontab jobs, for example:

```
10 8,13,17 * * * /usr/local/sbin/zfs_over_quota
```

Caching of quota reports for NFS clients and normal users
----------------------------------------------------------

The ``zfs userspace`` command is only permitted for the root user.
