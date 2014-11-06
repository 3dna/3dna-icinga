# == Class: icinga::server::config
#
# manages the icinga config as part of the icinga module
#
# === Parameters
#
#
# === Examples
# in your manifest:
# include icinga::server
# 
# in hiera:
# icinga::server::config::option: something
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna
#
class icinga::server::config (
) inherits icinga::server::params {

  file { $icinga::server::params::objects_dir:
    ensure  => directory,
    purge   => true,
    recurse => true,
    notify  => Class['icinga::server::configcheck'],
  }

  file { "${icinga::server::params::conf_dir}/icinga.cfg" :
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template("icinga/icinga.cfg.erb"),
    notify  => Class['icinga::server::configcheck'],
  }

  file { "${icinga::server::params::conf_dir}/cgi.cfg" :
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template("icinga/cgi.cfg.erb"),
    notify  => Class['icinga::server::configcheck'],
  }

  Icinga::Host <<| |>>
  Icinga::Service <<| |>>
  Icinga::Serviceescalation <<| |>>
  Icinga::Servicedependency <<| |>>
}
