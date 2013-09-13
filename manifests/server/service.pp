# == Class: icinga::service
#
# manages the icinga service as part of the icinga module. should not be included directly
#
# === Parameters
#
# [*service*]
#   override the default service name from icinga::params
# [*ensure*]
#   whether or not puppet should ensure the service. defaults to undef
# [*enable*]
#   whether or not the service is enabled to start. defaults to true
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
class icinga::service (
  $service = $icinga::params::service,
  $ensure  = undef,
  $enable  = true,
) {
  service { $service:
    ensure => $ensure,
    enable => $enable,
  }
}
