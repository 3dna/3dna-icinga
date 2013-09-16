# == Class: icinga::server::install
#
# install the icinga server packages, meant to be used only as part of the 'icinga' class
#
# === Parameters
#
# [*package*]
#   the name of the main icinga server package
# [*nrpe_plugin_package*]
#   the name of the package for the nrpe plugin
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna
#
class icinga::server::install (
  $package = $icinga::server::params::package,
  $nrpe_plugin_package = $icinga::server::params::nrpe_plugin_package
) inherits icinga::server::params {
  package { [$package,$nrpe_plugin_package]:
    ensure => installed,
  }
}
