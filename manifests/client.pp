# Define: gitssh::client
# ===========================
define gitssh::client(
  $clientid,
  $key,
  $ensure   = present,
  $type     = 'ssh-rsa',
  ) {
  include stdlib

  ssh_authorized_key { "git:${clientid}":
    ensure => $ensure,
    user   => 'git',
    type   => $type,
    key    => $key
  }
}
