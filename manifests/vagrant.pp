define vagrant_lxc::vagrant(
  $user           = $::id,
  $plugin_version = undef,
  $import_boxes = ['st01tkh/xenial64-lxc', 'st01tkh/stretch64-lxc', 'st01tkh/centos7-64-lxc'],
)
{
  if ($::kernel != 'linux') {
    fail("Sorry, LXC is linux only technology")
  }

  if !defined(Class['vagrant']) {
    class {'vagrant': }
  }
  if !defined(User["$user"]) {
    user { "$user":
      ensure => present,
      before => Vagrant::Plugin['vagrant-lxc'],
    }
  }

  vagrant::plugin {"vagrant-lxc-$user":
    user => $user,
    plugin_name => 'vagrant-lxc',
    plugin_version => $plugin_version
  }

  $import_boxes.each |String $import_box| {
    if !defined(Vagrant::Box[$import_box]) {
      vagrant::box { $import_box:
        box_provider => 'lxc',
        user         => $user,
        require => Vagrant::Plugin["vagrant-lxc-$user"],
      }
    }
  }
}
