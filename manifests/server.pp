# == Class: icinga::server
#
# this module installs configures and manages an icinga server
#
# === Parameters
#
# TODO: parameter docs
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Examples
#
# in your manifest:
# include icinga
#
# in hiera:
# icinga::server::config::foo: bar
# icinga::server::install::package: icinga
# icinga::server::service::service: icinga
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna Corp
#
class icinga::server (
  $enable_notifications = '0',
  $url_html_path = '/',
  $url_stylesheets_path = '/',
  $check_external_commands = false,
  $command_check_interval = '-1',
) inherits icinga::server::params {
  include icinga::server::install
  include icinga::server::config
  include icinga::server::configcheck
  include icinga::server::service

  $check_external_commands_bool = str2bool($check_external_commands)
  

  Class['icinga::server::install'] -> Class['icinga::server::config'] Class['icinga::server::configcheck'] ~> Class['icinga::server::service']

  anchor {
    'icinga::start': 
      before => [Class['icinga::server::install'],Class['icinga::server::config'],Class['icinga::server::configcheck']],
      notify => Class['icinga::server::service'];
    'icinga::end':
      require => Class['icinga::server::service'];
  }

}
