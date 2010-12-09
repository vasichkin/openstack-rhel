#!/bin/sh

VM="RHEL6_node"
SNAPID="aa30ecb7-34e2-41a2-b50e-40edfc701daa" # run 'ssh mac prlctl snapshot-list RHEL6_node' to get it

ssh mac prlctl stop $VM --kill
ssh mac prlctl snapshot-switch $VM -i $SNAPID
ssh mac prlctl start $VM
echo "Sleeping a bit to allow VM to boot"
sleep 20
ssh n /root/install.sh
