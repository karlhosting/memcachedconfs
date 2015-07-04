# memcachedconfs
Configurations for memcached servers and init scripts

This repo contains supervisord conf files installed on OSF (production 
and staging) to move management of memcached out of the system and into
the customer (our) area.

Installation
============

- git clone this repo in the home directory (osfkarl or karlstaging)

- cd memcachedconfs

- virtualenv .

- Symlink init.sh into /var/spool/init.d/srvuser

Production
==========

- Run multiple instances on different ports (to get around 2 GB limits)

- Set the maximum value size (to keep huge blobs from evicting btrees)

- Ensure that this supervisor and the memcaches that it manages turn on
  at reboot

- Set the program path, log file, and stdout correctly

