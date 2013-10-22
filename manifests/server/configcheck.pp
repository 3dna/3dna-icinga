# == Class: icinga::server::configcheck
#
# checks the generated configuration of icinga
#
# meant to be dropped into the chain of dependencies to prevent a busted
# config from breaking icinga.
#
# will become obsolete when the following puppet issues are resolved:
# http://projects.puppetlabs.com/issues/3323
# http://projects.puppetlabs.com/issues/1014
#
# === Variables
#
# None
#
# === Examples
#
# include icinga
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna
#
class icinga::server::configcheck (
  $icinga_path = $icinga::server::params::icinga_path,
  $config_file = $icinga::server::params::config_file,
) inherits icinga::server::params {
  exec { "icinga config check":
    command     => "${icinga_path} -v ${config_file}",
    refreshonly => true,
  }
}
