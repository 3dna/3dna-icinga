# == Define: icinga::command
#
# wraps nagios_command for icinga specific bits
#
# === Parameters
#
# everything nagios_command supports, including the target
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna Corp
#
define icinga::command (
  $target       = "${icinga::server::params::objects_dir}/command_${name}.cfg",
  $command_name = undef,
  $ensure       = undef,
  $command_line = undef,
  $poller_tag   = undef,
  $use          = undef,
  $notify       = Class['::icinga::server::service'],
) {
  include icinga::server::params

  file { $target:
    owner   => $icinga::server::params::icinga_user,
    mode    => 0644,
    require => Nagios_command[$name],
  }

  nagios_command { $name:
    target       => $target,
    notify       => $notify,
    ensure       => $ensure,
    command_line => $command_line,
    poller_tag   => $poller_tag,
    use          => $use,
  }
}
