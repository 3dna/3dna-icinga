# == Define: icinga::serviceescalation
#
# wraps nagios_serviceescalation for icinga specific bits
#
# === Parameters
#
# everything nagios_serviceescalation supports, including the target
#
# === Examples
#
# node to be monitored
# @@icinga::serviceescalation { $fqdn: }
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2014 3dna Corp
#
define icinga::serviceescalation (
  $target                = "${icinga::server::params::objects_dir}/serviceescalation_${name}.cfg",
  $ensure                = undef,
  $contact_groups        = undef,
  $contacts              = undef,
  $escalation_options    = undef,
  $escalation_period     = undef,
  $first_notification    = undef,
  $host_name             = undef,
  $hostgroup_name        = undef,
  $last_notification     = undef,
  $notification_interval = undef,
  $provider              = undef,
  $register              = undef,
  $service_description   = undef,
  $servicegroup_name     = undef,
  $use                   = undef,
  $notify                = Class['::icinga::server::configcheck'],
) {
  include icinga::server::params

  file { $target:
    owner   => $icinga::server::params::icinga_user,
    mode    => '0644',
    require => Nagios_serviceescalation[$name],
  }

  nagios_serviceescalation { $name:
    target                => $target,
    ensure                => $ensure,
    contact_groups        => $contact_groups,
    contacts              => $contacts,
    escalation_options    => $escalation_options,
    escalation_period     => $escalation_period,
    first_notification    => $first_notification,
    host_name             => $host_name,
    hostgroup_name        => $hostgroup_name,
    last_notification     => $last_notification,
    notification_interval => $notification_interval,
    provider              => $provider,
    register              => $register,
    service_description   => $service_description,
    servicegroup_name     => $servicegroup_name,
    use                   => $use,
    notify                => $notify,
  }
}
