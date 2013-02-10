# Class: php
#
# This module manages PHP.
#
# Parameters:
#
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
  $extensions = undef
)inherits php::params {
  class { 'php::package': }

  class { 'php::config':
    use_apc    => $use_apc,
    use_phpfpm => $use_phpfpm,
    require    => Class['php::package']
  }

  if $extensions {
    php::resource::extension { $extensions: }
  }

  if ('apc' in $extensions) {
    php::resource::extension['apc'] {
      prefix => 'php-',
    }
  }

  if ('fpm' in $extensions) {
    Php::Resource::Extension['fpm'] {
      has_service => true,
    }
  }
}