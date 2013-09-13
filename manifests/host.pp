# == Define: icinga::host
#
# wraps nagios_host for icinga specific bits
#
# === Parameters
#
# everything nagios_host supports, including the target
#
# === Examples
#
# node to be monitored
# @@icinga::host { $fqdn: }
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna Corp
#
define icinga::host (
) {
  include icinga::server::params

  nagios_host { $name:
    target => "${icinga::server::params::objects_dir}/${name}_host.cfg",
  }
}
