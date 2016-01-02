#!/bin/bash

set -e

# Updating and Upgrading dependencies
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y -qq > /dev/null
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -qq > /dev/null

# Install necessary libraries for guest additions and Vagrant NFS Share
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -q install linux-headers-$(uname -r) build-essential dkms nfs-common

# Install necessary dependencies
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -q install curl wget git vim unzip

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Setup sudo to allow no-password sudo for "admin"
groupadd -r admin
usermod -a -G admin vagrant
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers
