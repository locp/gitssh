# Define: gitssh::client
# ===========================
define gitssh::client(
  $ensure   = present,
  $type     = 'ssh-rsa',
  $key      = undef,
  ) {
  ssh_authorized_key { "gitssh::client::${title}":
    ensure  => $ensure,
    user    => 'git',
    type    => $type,
    key     => $key,
    require => User['git']
  }
}
