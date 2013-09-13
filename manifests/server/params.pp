# == Class: icinga::server::params
#
# OS specific params for the icinga module
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna Corp
#
class icinga::server::params {
  case $::osfamily {
    'Debian': {
      $conf_dir = "/etc/icinga"
      $objects_dir = "/etc/icinga/objects"
      $package = 'icinga'
      $service = 'icinga'
      $icinga_user = 'nagios'
    }
    default: {
      fail("${::osfamily} not supported, please submit a pull request")
    }
  }
}
