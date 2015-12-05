# Class: gitssh
# ===========================
class gitssh(
  $basedir        = '/var/git',
  $package_ensure = present,
  $package_name   = 'git',
  $purge_ssh_keys = true,
  ) {
  package { $package_name:
    ensure => $package_ensure,
  }

  exec { '/bin/echo /usr/bin/git-shell >> /etc/shells':
    unless => '/bin/grep -q \'^/usr/bin/git-shell$\' /etc/shells',
    before => User['git']
  }

  user { 'git':
    ensure         => present,
    home           => $basedir,
    shell          => '/usr/bin/git-shell',
    require        => Package[$package_name],
    managehome     => true,
    purge_ssh_keys => $purge_ssh_keys,
    before         => File[$reposdir]
  }

  $reposdir = "${basedir}/repos"

  file { $reposdir:
    ensure => directory,
    owner  => 'git',
    group  => 'git',
    mode   => '0700',
  }
}
