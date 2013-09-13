# == Class: icinga::server::service
#
# manages the icinga server service as part of the icinga module. should not be included directly
#
# === Parameters
#
#
# === Examples
# in your manifest:
# include icinga::server
# 
# in hiera:
# icinga::server::config::option: something
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna
#
class icinga::server::config (
) inherits icinga::server::params {

  file { $icinga::server::params::objects_dir:
    ensure  => directory,
    purge   => true,
    recurse => true,
  }

  Icinga::Host <<| |>>
  Icinga::Service <<| |>>
}
