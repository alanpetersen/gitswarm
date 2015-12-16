# GitSwarm

## Overview

Installs and configures Perforce GitSwarm. See the following for more information:

- [GitSwarm Install Guide](https://www.perforce.com/perforce/r15.4/user/gitswarm-install.txt)
- [GitSwarm Manual](https://www.perforce.com/perforce/r15.3/manuals/gitswarm/)

## Post-Install

The installation will create an administrative account in GitSwarm called `root` with the password `5iveL!fe`. When you log in, you will be asked to change that password to something that isn't on a README page on GitHub.

Once logged in, you can create projects, new users, groups, etc.

## The P4D Instance

The installation creates a P4D instance running on `ssl::1666`. Logged into the instance, you can run `p4 info` to get more information:

<pre>$ p4 -p ssl::1666 info
User name: root
Client name: gitswarm (illegal)
Client host: gitswarm.host.com
Client unknown.
Current directory: /root
Peer address: 127.0.0.1:52339
Client address: 127.0.0.1
Server address: gitswarm.host.com:1666
Server root: /var/opt/gitswarm/perforce/data
Server date: 2015/12/16 14:58:15 +0000 UTC
Server uptime: 11:46:10
Server version: P4D/LINUX26X86_64/2015.2/1311674 (2015/12/06)
Server encryption: encrypted
Server cert expires: Dec 15 03:12:05 2017 GMT
Server license: none
Case Handling: sensitive</pre>

### Logging In

There are several Perforce user accounts that are created initially in the instance:

<pre>$ p4 -p ssl::1666 -u gitswarm users
git-fusion-user <git-fusion-user@GF_0xS_Sx0_FG> (Git Fusion) accessed 2015/12/16
gitswarm <gitswarm@gitswarm> (gitswarm) accessed 2015/12/16
root <root@gitswarm-temp-4c0fdc89-904d-4687-b6d1-0eaf4b6a1c37> (root) accessed 2015/12/16
unknown_git <unknown_git@helixenterprise> (Unknown Git Contributor) accessed 2015/12/16</pre>

The gitswarm user has an existing ticket

<pre>p4 -p ssl::1666 -u gitswarm login -s
User gitswarm ticket expires in 4 hours 8 minutes.</pre>

And that user is a superuser

<pre>Protections:
	write user * * //...
	super user gitswarm * //...
	super user root * //...
	admin user git-fusion-user * //...
	review user git-fusion-reviews-* * //...</pre>

So you should use that account to set the password for the root account in p4d:

<pre>p4 -p ssl::1666 -u gitswarm passwd root
Enter new password: **********
Re-enter new password: *********
Password updated.</pre>

Note that security is configured to be **level 3**, so strong passwords are required.

<pre>p4 -p ssl::1666 -u gitswarm configure show
P4ROOT=/var/opt/gitswarm/perforce/data
P4PORT=ssl:1666
P4JOURNAL=journal
P4DEBUG=server=3
P4LOG=log
security=3 (configure)
unicode=1 (configure)
p4zk.log.file=p4zk.log (default)
auth.default.method=perforce (default)
zk.connect.timeout=300 (default)
server: 3 (P4DEBUG)
dm.protects.allow.admin: 1 (configure)</pre>

## Limitations

Currently, only supports RedHat/CentOS. Debian coming soon.


