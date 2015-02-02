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
apt-get install -y python-software-properties build-essential

# install node
curl -sL https://deb.nodesource.com/setup | sudo bash -

# install rvm
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | sudo bash -s stable
chmod -R g+w /usr/local/rvm
rvm install ruby-2.1.0  

# repositories
add-apt-repository -y ppa:keithw/mosh          # mosh
apt-add-repository -y ppa:fish-shell/release-2 # fish
apt-get update

# install it all at once
apt-get -y install byobu fish git toilet fail2ban nodejs htop zip emacs

# set default group
addgroup serenity
usermod -g serenity root
echo "%serenity   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/serenity
chmod 0440 /etc/sudoers.d/serenity

# checkout serenity
mkdir -p /serenity
cd /serenity
git clone https://github.com/RamonGebben/Serenity.io.git /serenity
mkdir -p /serenity/projects
mkdir -p /serenity/flags

# fix ownership
chown -R root:serenity /serenity 
chown -R root:serenity /serenity

# link fish functions
rm -r /etc/fish/functions
ln -s /serenity/fish /etc/fish/functions

# fix default umask
sed -i 's/UMASK\s*022/UMASK 002/g' /etc/login.defs

echo "==========================================================================="
echo "REBOOT and run ds-update"
#reboot
