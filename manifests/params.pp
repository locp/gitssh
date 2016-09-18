# == Class gitssh::params
#
# This class is meant to be called from gitssh
# It sets variables according to platform
#
class gitssh::params {
  case $::osfamily {
    'Debian': {
      $mkdir = '/bin/mkdir'
    }
    'RedHat': {
      $mkdir = '/usr/bin/mkdir'
    }
    default: {}
  }
}
