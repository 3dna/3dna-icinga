# == Define: icinga::hostgroup
#
# wraps nagios_hostgroup for icinga specific bits
#
# === Parameters
#
# everything nagios_hostgroup supports, including the target
#
# === Examples
#
# node to be monitored
# @@icinga::hostgroup { 'atl': }
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2014 3dna Corp
#
define icinga::hostgroup (
  $hostgroup_name = $name,
  $ensure     = undef,
  $action_url = undef,
  $icinga_alias = undef,
  $group = undef,
  $hostgroup_members = undef,
  $members = undef,
  $mode = undef,
  $notes = undof,
  $notes_url = undef,
  $owner = undef,
  $provider = undef,
  $realm = undef,
  $register = undef,
  $target       = "${icinga::server::params::objects_dir}/host_${name}.cfg",
  $use = undef,
) {
  include icinga::server::params

  file { $target:
    owner   => $icinga::server::params::icinga_user,
    mode    => 0644,
    require => Nagios_host[$name],
  }

  nagios_hostgroup { $name:
    hostgroup_name    => $hostgroup_name,
    ensure            => $ensure,
    action_url        => $action_url,
    icinga_alias      => $icinga_alias,
    group             => $group,
    hostgroup_members => $hostgroup_members,
    members           => $members,
    mode              => $mode,
    notes             => $notes,
    notes_url         => $notes_url,
    owner             => $owner,
    provider          => $provider,
    realm             => $realm,
    register          => $register,
    target            => $target,
    use               => $use,
  }
}
