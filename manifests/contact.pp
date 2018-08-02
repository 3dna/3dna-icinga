# == Define: icinga::contact
#
# wraps nagios_contact for icinga specific bits
#
# === Parameters
#
# everything nagios_contact supports, including the target
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna Corp
#
define icinga::contact (
  $contact_name                  = $name,
  $ensure                        = undef,
  $address1                      = undef,
  $address2                      = undef,
  $address3                      = undef,
  $address4                      = undef,
  $address5                      = undef,
  $address6                      = undef,
  $icinga_alias                  = undef,
  $can_submit_commands           = undef,
  $contactgroups                 = undef,
  $email                         = undef,
  $host_notification_commands    = undef,
  $host_notification_options     = undef,
  $host_notification_period      = undef,
  $host_notifications_enabled    = undef,
  $pager                         = undef,
  $register                      = undef,
  $retain_nonstatus_information  = undef,
  $retain_status_information     = undef,
  $service_notification_commands = undef,
  $service_notification_options  = undef,
  $service_notification_period   = undef,
  $service_notifications_enabled = undef,
  $target                        = "${icinga::server::params::objects_dir}/contact_${name}.cfg",
  $use                           = undef,
  $notify                        = Class['::icinga::server::configcheck'],
) {
  include icinga::server::params

  file { $target:
    owner   => $icinga::server::params::icinga_user,
    mode    => '0644',
    require => Nagios_contact[$name],
  }

  nagios_contact { $name:
    contact_name                  => $contact_name,
    ensure                        => $ensure,
    address1                      => $address1,
    address2                      => $address2,
    address3                      => $address3,
    address4                      => $address4,
    address5                      => $address5,
    address6                      => $address6,
    alias                         => $icinga_alias,
    can_submit_commands           => $can_submit_commands,
    contactgroups                 => $contactgroups,
    email                         => $email,
    host_notification_commands    => $host_notification_commands,
    host_notification_options     => $host_notification_options,
    host_notification_period      => $host_notification_period,
    host_notifications_enabled    => $host_notifications_enabled,
    pager                         => $pager,
    register                      => $register,
    retain_nonstatus_information  => $retain_nonstatus_information,
    retain_status_information     => $retain_status_information,
    service_notification_commands => $service_notification_commands,
    service_notification_options  => $service_notification_options,
    service_notification_period   => $service_notification_period,
    service_notifications_enabled => $service_notifications_enabled,
    target                        => $target,
    use                           => $use,
    notify                        => $notify,
  }
}
