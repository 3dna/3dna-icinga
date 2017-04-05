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
      $conf_dir = '/etc/icinga'
      $objects_dir = '/etc/icinga/objects'
      $package = 'icinga'
      $nrpe_plugin_package = 'nagios-nrpe-plugin'
      $service = 'icinga'
      $icinga_user = 'nagios'
      $config_file = '/etc/icinga/icinga.cfg'
      $icinga_path = '/usr/sbin/icinga'
    }
    default: {
      fail("${::osfamily} not supported, please submit a pull request")
    }
  }
}
