# packer-vagrant
Build minimal image with packer and vagrant with virtualbox
  with debian net install iso (debian-8.2.0-amd64-netinst.iso)
  preseed (debian/http/preseed.cfg)
  
Inspired from https://github.com/flomotlik/packer-example.git

## prereq
* download (https://www.packer.io/downloads.html) & install packer in THIS_DIR/bin
* download (https://www.vagrantup.com/downloads.html) & install vagrant
* read and adapt: debian/packer.json
* preseed file is in debian/http/preseed.cfg
* postinstall scripts file is in debian/scripts/*.sh
* launch: debian/create_box

## Tested on
* MacOSX
