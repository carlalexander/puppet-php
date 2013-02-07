# Class: php
#
# This module manages PHP.
#
# Parameters:
#
#   [*use_apc*]    - Use APC extension
#   [*use_phpfpm*] - Use PHP-FPM service
#   [*extensions*] - List of extensions to install
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# The module works with sensible defaults:
#
# node default {
#   class { 'php': }
# }
class php (
  $use_apc    = false,
  $use_phpfpm = false,
  $extensions = undef
)inherits php::params {
  class { 'php::package': }

  class { 'php::config':
    use_apc    => $use_apc,
    use_phpfpm => $use_phpfpm,
    require    => Class['php::package']
  }

  if $use_apc {
    php::resource::extension { 'apc':
      prefix => 'php-',
    }
  }

  if $use_phpfpm {
    php::resource::extension { 'fpm':
      has_service => true,
    }
  }

  if $extensions {
    php::resource::extension { $extensions: }
  }
}