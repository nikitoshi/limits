#!/bin/sh

case "$1" in
        start)
                uci del sqm.lan.qdisc_advanced='0'
                uci del sqm.lan.iqdisc_opts='autorate-ingress nat dual-dsthost'
                uci del sqm.lan.eqdisc_opts='nat dual-srchost'
                uci del sqm.lan.iqdisc_opts
                uci del sqm.lan.eqdisc_opts
                uci set sqm.lan.upload='0'
                uci set sqm.lan.download='512'
                uci set sqm.lan.script='simple.qos'
                uci set sqm.lan.enabled='1'
                uci commit
                /etc/init.d/sqm restart
        ;;
        stop)
                uci set sqm.lan.enabled='0'
                uci commit
                /etc/init.d/sqm restart
        ;;
esac
