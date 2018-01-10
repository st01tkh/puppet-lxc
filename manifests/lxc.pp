class vagrant_lxc::lxc {
  if ($::kernel != 'linux') {
    fail("Sorry, LXC is linux only technology")
  }
  
  $dist_family = downcase($::operatingsystem)
  case $dist_family {
    'ubuntu': {
      $packages = ['lxc', 'lxc-templates', 'cgroup-lite', 'redir']
    }
    'debian': {
      $packages = ['lxc', 'cgroup-bin', 'redir']
    }
    default: {
      fail("Sorry, $dist_family is not supported yet")
    }
  }
  ensure_packages($packages, {
    'ensure' => 'present'
  })

  file { "/etc/profile.d/vagrant_default_provider.sh":
    content => 'export VAGRANT_DEFAULT_PROVIDER="lxc"'
  }
}
