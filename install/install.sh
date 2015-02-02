#!/bin/sh 

# fix locale error messages with apt
echo "LANG=\"en_US.UTF-8\"" > /etc/default/locale
echo "LANGUAGE=\"en_US.UTF-8\"" >> /etc/default/locale
echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale
echo "LC_BYOBU=1" >> /etc/default/locale  # make byoby system-wide default, if its installed
locale-gen en_US en_US.UTF-8
dpkg-reconfigure locales
mkdir /root/.byobu
echo "source /serenity/config/byobu" > /root/.byobu/.tmux.conf

# upgrade to zero-day
apt-get update
apt-get -y upgrade

# add support for ppa
apt-get install -y python-software-properties
curl -sL https://deb.nodesource.com/setup | sudo bash -

# repositories
add-apt-repository -y ppa:keithw/mosh  # mosh
apt-get update

# install it all at once
apt-get -y install byobu fish git toilet fail2ban nodejs

# set default group
addgroup serenity
usermod -g serenity root
echo "%serenity   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/serenity
chmod 0440 /etc/sudoers.d/serenity

# checkout serenity
mkdir -p /serenity
cd /serenity
git clone https://github.com/RamonGebben/serenity.git .
mkdir -p /serenity/sites
mkdir -p /serenity/flags

# fix ownership
chown -R root:serenity /serenity 
chown -R root:serenity /serenity

# link fish functions
ln -s /serenity/fish /etc/fish/functions

# fix default umask
sed -i 's/UMASK\s*022/UMASK 002/g' /etc/login.defs

echo "==========================================================================="
echo "REBOOT and run ds-update"
#reboot
