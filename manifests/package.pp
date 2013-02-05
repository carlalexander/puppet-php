# Class: php::package
#
# This module manages the PHP package installation
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
class php::package {
  package { 'php5':
    ensure => latest,
  }
}