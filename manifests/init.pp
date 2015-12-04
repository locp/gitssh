# Class: gitssh
# ===========================
class gitssh {
  package { 'git':
    ensure => present,
  }

  user { 'git':
    ensure     => present,
    shell      => '/usr/bin/git-shell',
    require    => Package['git'],
    managehome => true,
  }

  exec { '/bin/echo /usr/bin/git-shell >> /etc/shells':
    unless => '/bin/grep -q \'^/usr/bin/git-shell$\' /etc/shells'
  }
}
