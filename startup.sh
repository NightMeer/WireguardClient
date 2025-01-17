#!/bin/sh

cp /config/wg0.conf /etc/wireguard/wg0.conf

nic=$(ip link | awk -F: '$0 !~ "lo|vir|wl|wg|^[^0-9]"{print $2;getline}')
sed -i "s/_nic/$nic/g" /etc/wireguard/wg0.conf

wg-quick up wg0

tail -f /dev/null
