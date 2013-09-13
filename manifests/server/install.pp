# == Class: icinga::server::install
#
# install the icinga package, meant to be used only as part of the 'icinga' class
#
# === Parameters
#
# [*$icinga::params::package*]
#   the name of the package
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
  $package = $icinga::server::params::package
) inherits icinga::server::params {
  package { $package:
    ensure => installed,
  }
}
