# Define: gitssh::repo
# ===========================
define gitssh::repo(
  $repo_name   = undef,
  $ensure      = present,
  ) {
  require gitssh
  $basedir = $::gitssh::basedir

  if $repo_name != undef {
    $dirname = "${basedir}/repos/${repo_name}.git"
  } else {
    $dirname = "${basedir}/repos/${title}.git"
  }

  exec { "/usr/bin/mkdir ${dirname}":
    unless  => "/usr/bin/test -d ${dirname}",
    user    => 'git',
    require => Class['gitssh'],
    notify  => Exec['create_repo']
  }

  exec { 'create_repo':
    command     => '/usr/bin/git --bare init',
    cwd         => $dirname,
    refreshonly => true,
    user        => 'git'
  }
}
