# == Class: icinga::params
#
# OS specific params for the icinga module
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna Corp
#
class icinga::params {
  case $::osfamily {
    'Debian': {
    }
    default: {
      fail("${::osfamily} not supported, please submit a pull request")
    }
}
