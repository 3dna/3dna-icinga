# == Class: icinga::server::exports
#
# collects exported icinga resources
#
# === Parameters
#
#
# === Examples
# in your manifest:
# include icinga::server
# in hiera:
# icinga::server::exports::option: something
#
# === Authors
#
# Jeremy Holland <holland@nationbuilder.com>
#
# === Copyright
#
# Copyright 2017 3dna
#
class icinga::server::exports (
) inherits icinga::server {
  Icinga::Host <<| |>>
  Icinga::Service <<| |>>
  Icinga::Serviceescalation <<| |>>
  Icinga::Servicedependency <<| |>>
}
