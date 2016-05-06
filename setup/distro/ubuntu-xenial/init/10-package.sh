#!/usr/bin/env bash
# Environment variables DISTRO_DIR and TEMP_DIR are available

[[ "$SKIP_PACKAGE" = true ]] && exit 0

# Update to get package list
apt-get update
# Install add-apt-repository command
apt-get install -y software-properties-common

# MariaDB Ubuntu PPA
# Upgrades to 10.1
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
add-apt-repository 'deb [arch=amd64,i386] http://mirror.netinch.com/pub/mariadb/repo/10.1/ubuntu xenial main'

# Nginx Stable Ubuntu PPA
# add-apt-repository ppa:nginx/stable

# Update again after PPA changes
apt-get update
apt-get upgrade -y

packages=$(readlist package)
apt-get install -y $packages

exit 0