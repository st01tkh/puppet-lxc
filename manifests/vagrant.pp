define vagrant_lxc::vagrant(
  $user           = $::id,
  $plugin_version = undef
)
{
  if ($::kernel != 'linux') {
    fail("Sorry, LXC is linux only technology")
  }

  $boxes = [
    'fgrehm/trusty64-lxc', 'fgrehm/precise64-lxc', 'fgrehm/wheezy64-lxc', 
    'fgrehm/centos-6-64-lxc', 'frensjan/centos-7-64-lxc', 'obnox/fedora23-64-lxc'
  ]


  class {'vagrant': }
  if ! defined(User["$user"]) {
    user { "$user":
      ensure => present,
      before => Vagrant::Plugin['vagrant-lxc'],
    }
  }
  vagrant::plugin {'vagrant-lxc':
    user => $user,
    plugin_version => $plugin_version
  } ->
  vagrant::box { 'fgrehm/trusty64-lxc':
    box_provider => 'lxc',
    user         => $user,
  }
}
