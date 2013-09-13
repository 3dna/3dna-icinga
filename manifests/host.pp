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
  $address = undef,
  $target = "${icinga::server::params::objects_dir}/${name}_host.cfg",
  $alias = undef,
  $notifications_enabled = undef,
  $event_handler_enabled = undef,
  $flap_detection_enabled = undef,
  $failure_prediction_enabled = undef,
  $process_perf_data = undef,
  $retain_status_information = undef,
  $retain_nonstatus_information = undef,
  $check_command = undef,
  $max_check_attempts = undef,
  $notification_interval = undef,
  $notification_period = undef,
  $notification_options = undef,
  $contact_groups = undef,
  $register = undef,
  $use = undef,
) {
  include icinga::server::params

  file { "${icinga::server::params::objects_dir}/${name}_host.cfg":
    owner   => $icinga::server::params::icinga_user,
    mode    => 0644,
    require => Nagios_host[$name],
  }

  nagios_host { $name:
    target                       => $target,
    address                      => $address,
    alias                        => $alias,
    notificatios_enabled         => $notifications_enabled,
    event_handler_enabled        => $event_handler_enabled,
    flap_detection_enabled       => $flap_detection_enabled,
    failure_prediction_enabled   => $failure_prediction_enabled,
    process_perf_data            => $process_perf_data,
    retain_status_information    => $retain_status_information,
    retain_nonstatus_information => $retain_nonstatus_information,
    check_command                => $check_command,
    max_check_attempts           => $max_check_attempts,
    notification_interval        => $notification_interval,
    notification_period          => $notification_period,
    notification_options         => $notification_options,
    contact_groups               => $contact_groups,
    register                     => $register,
    use                          => $use,
  }
}
