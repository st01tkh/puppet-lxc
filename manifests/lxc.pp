class vagrant_lxc::lxc {
  if ($::kernel != 'linux') {
    fail("Sorry, LXC is linux only technology")
  }
  
  $packages = ['lxc', 'lxc-templates', 'cgroup-lite', 'redir']
  package { $packages :
    ensure => installed,
  }

  file { "/etc/profile.d/vagrant_default_provider.sh":
    content => 'export VAGRANT_DEFAULT_PROVIDER="lxc"'
  }
}
