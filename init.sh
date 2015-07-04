#!/bin/bash
# Wrapper script to start/stop supervisord from userinit.
# Copyright (c) gocept gmbh & co. kg
# See also LICENSE.txt
set -e

PATH="${PATH}:/usr/local/sbin:/usr/sbin:/sbin"
DAEMON="${HOME}/memcachedconfs/bin/supervisord -c ${HOME}/memcachedconfs/production.conf"
CTL="${HOME}/memcachedconfs/bin/supervisorctl -c ${HOME}/memcachedconfs/production.conf"
PIDFILE="/run/local/supervisord-memcachedconfs.pid"

start() {
    start-stop-daemon --start -p "$PIDFILE" -i -- "$DAEMON"
}

stop() {
    "$CTL" shutdown
}

restart() {
    "$CTL" restart all
}

status() {
    "$CTL" status
}

case $1 in
    start|stop|status)
        $1;;
    restart)
        restart || {
            stop || true
            start
        }
        ;;
esac