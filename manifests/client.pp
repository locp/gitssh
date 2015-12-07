# Define: gitssh::client
# ===========================
define gitssh::client(
  $clientid = undef,
  $ensure   = present,
  $type     = 'ssh-rsa',
  $key      = undef,
  ) {
  if $clientid != undef {
    $ssh_authorized_key_title = $clientid
  } else {
    $ssh_authorized_key_title = $title
  }

  ssh_authorized_key { $ssh_authorized_key_title:
    ensure  => $ensure,
    user    => 'git',
    type    => $type,
    key     => $key,
    require => User['git']
  }
}
