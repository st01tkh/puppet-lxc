define vagrant_lxc::vagrant(
  $user           = $::id,
  $plugin_version = undef
)
{
  if ($::kernel != 'linux') {
    fail("Sorry, LXC is linux only technology")
  }
  class {'vagrant': } ->
  user { "$user":
    ensure => present,
  } ->
  vagrant::plugin {'vagrant-lxc':
    user => $user,
    plugin_version => $plugin_version
  } ->
  vagrant::box {'fgrehm/trusty64-lxc':
    box_provider => 'lxc',
    user         => $user,
  }
}
