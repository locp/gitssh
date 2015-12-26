# Define: gitssh::repo
# ===========================
define gitssh::repo(
  $ensure = present,
  ) {
  include '::gitssh'

  $basedir = $::gitssh::basedir
  $dirname = "${basedir}/${title}.git"

  if $ensure == present {
    exec { "/usr/bin/mkdir ${dirname}":
      unless  => "/usr/bin/test -d ${dirname}",
      user    => 'git',
      require => Package[$::gitssh::package_name],
      notify  => Exec["create_repo ${title}"]
    }

    exec { "create_repo ${title}":
      command     => '/usr/bin/git --bare init',
      cwd         => $dirname,
      refreshonly => true,
      user        => 'git'
    }
  } elsif $ensure == absent {
    file { $dirname:
      ensure => absent,
    }
  } else {
    fail("Unknow value '${ensure}' passed to ensure!")
  }
}
