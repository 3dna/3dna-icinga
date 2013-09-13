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
  $address,
  $target = "${icinga::server::params::objects_dir}/${name}_host.cfg",
  $max_check_attempts = 3,
  $alias = $name,
) {
  include icinga::server::params

  file { "${icinga::server::params::objects_dir}/${name}_host.cfg":
    owner   => $icinga::server::params::icinga_user,
    mode    => 0644,
    require => Nagios_host[$name],
  }

  nagios_host { $name:
    target             => $target,
    max_check_attempts => $max_check_attempts,
    address            => $address,
    alias              => $alias,
  }
}
