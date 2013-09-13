# == Define: icinga::contactgroup
#
# wraps nagios_contactgroup for icinga specific bits
#
# === Parameters
#
# everything nagios_contactgroup supports, including the target
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna Corp
#
define icinga::contactgroup (
  $target               = "${icinga::server::params::objects_dir}/contactgroup_${name}.cfg",
  $icinga_alias         = undef,
  $contactgroup_name    = undef,
  $ensure               = undef,
  $contactgroup_members = undef,
  $members              = undef,
  $provider             = undef,
  $register             = undef,
  $use                  = undef,
) {
  include icinga::server::params

  file { $target:
    owner   => $icinga::server::params::icinga_user,
    mode    => 0644,
    require => Nagios_contactgroup[$name],
  }

  nagios_contactgroup { $name:
    alias                => $icinga_alias,
    target               => $target,
    contactgroup_name    => $contactgroup_name,
    ensure               => $ensure,
    contactgroup_members => $contactgroup_members,
    members              => $members,
    provider             => $provider,
    register             => $register,
    use                  => $use,
    notify               => Class['::icinga::server::service'],
  }
}
