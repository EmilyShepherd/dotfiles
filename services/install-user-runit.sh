#!/bin/sh

mkdir /etc/sv/user
cp user /etc/sv/user/run
ln -s /etc/sv/user /var/service/
ln -s /run/runit/supervise.user /etc/sv/user/supervise
