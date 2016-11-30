#version=DEVEL

# System authorization information
auth --enableshadow --passalgo=sha512

# Use CDROM installation media
# cdrom
# Use graphical install

# graphical or text
text
skipx

# Run the Setup Agent on first boot
firstboot --disable

ignoredisk --only-use=vda

# Keyboard layouts
keyboard --vckeymap=no --xlayouts='no'

# System language
lang en_US.UTF-8

# Network information
network  --bootproto=static --device=ens3 --gateway=10.240.0.1 --ip=10.240.0.51 --nameserver=10.240.0.1 --netmask=255.255.255.0 --noipv6 --activate
network  --hostname=test.example.com

# Security
firewall --disabled
selinux  --disabled


# Root password
# Root password is redhat
rootpw --iscrypted $6$a.26ywQsgJJ.ben6$NhB.p.q3wN6e2YzixvmnzFUa6hbPllMkQeH64QopC4uvJ/1QVgUp0kEUQCmG4vHCQsutj5b7iZ.dhMcH9WtId/

# Root SSH key
# Kamran's RSA public key 
# https://docs.fedoraproject.org/en-US/Fedora//html/Installation_Guide/sect-kickstart-commands-sshkey.html

sshkey --username=root "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAx+5TIvYxBryI9d3DjvAeDv4q8xycNbXAAmfOIwhXL0D7So67MpmnQavwHaE/dVsGzP/9XMcidOYl7xBK0aN0fozApThWHaeKpWuJC2w4qE0ijD6tCAbnA7/Wach1rEmGVtRKo5B5lpPXuTedoixM/St/T46wnLFIwsDdFOTMyk9QHRtQ+uJAKv/lkuimMZjDRWeJE5ggwR4SNsc306R9ArnDBdj9HJ3xeUb5rqiBCe1qV3a5k8MpjsaIgG8KPx5dvXRhOTFE4ueh+2wLMy6ydy68NU5kltBtxqBA8CYbEyYmUL/cqRdx6ZVkL8AT5Pv44e2JRnN3kE70HJADfoDX5w== kamran@wbitt.com"

# System services
services --enabled="chronyd" 
services --disabled="firewalld"

# System timezone
timezone Europe/Oslo --ntpservers=0.fedora.pool.ntp.org


# System bootloader configuration
bootloader --location=mbr --boot-drive=vda

# Partition clearing information
clearpart --all --initlabel

# Disk partitioning information
part / --fstype="xfs" --ondisk=vda --size=2048 --grow
part swap --fstype="swap" --ondisk=vda --size=1024

# Shutdown or reboot the node after installation. (can also use reboot)
shutdown


# Packages to install:
%packages
# @^server-product-environment
@core
chrony
openssh-server
curl
wget
bridge-utils
bash
# cockpit does not exist # ???!!! This SHOULD exist!
dnf
## yum # does not exist
iproute
iptables
less
logrotate
lsof
net-tools
openssl
openssh-clients
python
python2-dnf
rpm
sed
gawk
grep
grub2
sudo
tar
telnet
tzdata
unzip
which
xz
zip
vim-enhanced

%end

