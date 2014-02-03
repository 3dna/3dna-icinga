# == Define: icinga::servicedependency
#
# wraps nagios_servicedependency for icinga specific bits
#
# === Parameters
#
# everything nagios_servicedependency supports, including the target
#
# === Examples
#
# node to be monitored
# @@icinga::servicedependency { $fqdn: }
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna Corp
#
define icinga::servicedependency (
  $target                        = "${icinga::server::params::objects_dir}/servicedependency_${name}.cfg",
  $ensure                        = undef,
  $dependency_period             = undef,
  $dependent_host_name           = undef,
  $dependent_hostgroup_name      = undef,
  $dependent_service_description = undef,
  $execution_failure_criteria    = undef,
  $host_name                     = undef,
  $hostgroup_name                = undef,
  $inherits_parent               = undef,
  $notification_failure_criteria = undef,
  $provider                      = undef,
  $register                      = undef,
  $service_description           = undef,
  $use                           = undef,
) {
  include icinga::server::params

  file { $target:
    owner   => $icinga::server::params::icinga_user,
    mode    => 0644,
    require => Nagios_servicedependency[$name],
  }

  nagios_servicedependency { $name:
    target                        => $target,
    ensure                        => $ensure,
    dependency_period             => $dependency_period,
    dependent_host_name           => $dependent_host_name,
    dependent_hostgroup_name      => $dependent_hostgroup_name,
    dependent_service_description => $dependent_service_description,
    execution_failure_criteria    => $execution_failure_criteria,
    host_name                     => $host_name,
    hostgroup_name                => $hostgroup_name,
    inherits_parent               => $inherits_parent,
    notification_failure_criteria => $notification_failure_criteria,
    provider                      => $provider,
    register                      => $register,
    service_description           => $service_description,
    use                           => $use,
  }
}
