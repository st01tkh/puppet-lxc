# == Define: vagrant_lxc
#
# Setup of vagrant, vagrant-lxc plugin, lxc and appropriate dependencies
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  vagrant_lxc {
#    user => [ 'root', 'user01', 'user02' ],
#  }
#
# === Authors
#
# st01tkh <st01tkh@gmail.com>
#
# === Copyright
#
# Copyright 2016 st01tkh
#
define vagrant_lxc(
  $user           = $::id,
  $plugin_version = undef,
  $import_boxes = [],
) {
  include vagrant_lxc::lxc
  vagrant_lxc::vagrant {'install_vagrant_lxc_and_boxes':
    import_boxes => $import_boxes,
    user => $user,
  }
}
