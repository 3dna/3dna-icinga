# == Define: icinga::servicegroup
#
# wraps nagios_servicegroup for icinga specific bits
#
# === Parameters
#
# everything nagios_servicegroup supports, including the target
#
# === Examples
#
# node to be monitored
# @@icinga::servicegroup { 'atl': }
#
# === Authors
#
# David Lovitch <dml@nationbuilder.com>
#
# === Copyright
#
# Copyright 2014 3dna Corp
#
define icinga::servicegroup (
  $servicegroup_name    = $name,
  $ensure               = undef,
  $action_url           = undef,
  $icinga_alias         = undef,
  $group                = undef,
  $members              = undef,
  $notes                = undef,
  $notes_url            = undef,
  $provider             = undef,
  $register             = undef,
  $servicegroup_members = undef,
  $target               = "${icinga::server::params::objects_dir}/servicegroup_${name}.cfg",
  $use                  = undef,
) {
  include icinga::server::params

  file { $target:
    owner   => $icinga::server::params::icinga_user,
    mode    => '0644',
    require => Nagios_servicegroup[$name],
  }

  nagios_servicegroup { $name:
    servicegroup_name     => $servicegroup_name,
    ensure                => $ensure,
    action_url            => $action_url,
    alias                 => $icinga_alias,
    group                 => $group,
    members               => $members,
    notes                 => $notes,
    notes_url             => $notes_url,
    provider              => $provider,
    register              => $register,
    servicegroup_members  => $servicegroup_members,
    target                => $target,
    use                   => $use,
    notify                => Class['::icinga::server::configcheck'],
  }
}
