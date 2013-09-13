# == Class: icinga
#
# this module installs configures and manages an icinga installation
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
# icinga::config::foo: bar
# icinga::install::package: icinga
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna Corp
#
class icinga {
  require icinga::server
}
