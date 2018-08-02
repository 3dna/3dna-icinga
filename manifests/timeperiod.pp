# == Define: icinga::timeperiod
#
# wraps nagios_timeperiod for icinga specific bits
#
# === Parameters
#
# everything nagios_timeperiod supports, including the target
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna Corp
#
define icinga::timeperiod (
  $timeperiod_name = $name,
  $target          = "${icinga::server::params::objects_dir}/timeperiod_${name}.cfg",
  $ensure          = undef,
  $icinga_alias    = undef,
  $exclude         = undef,
  $friday          = undef,
  $monday          = undef,
  $register        = undef,
  $saturday        = undef,
  $sunday          = undef,
  $thursday        = undef,
  $tuesday         = undef,
  $use             = undef,
  $wednesday       = undef,
  $notify          = Class['::icinga::server::configcheck'],

) {
  include icinga::server::params

  file { $target:
    owner   => $icinga::server::params::icinga_user,
    mode    => '0644',
    require => Nagios_timeperiod[$name],
  }

  nagios_timeperiod { $name:
    target          => $target,
    timeperiod_name => $timeperiod_name,
    ensure          => $ensure,
    alias           => $icinga_alias,
    exclude         => $exclude,
    friday          => $friday,
    monday          => $monday,
    register        => $register,
    saturday        => $saturday,
    sunday          => $sunday,
    thursday        => $thursday,
    tuesday         => $tuesday,
    use             => $use,
    wednesday       => $wednesday,
    notify          => $notify,
  }
}
