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
  $use_phpfpm = 'fpm' in $extensions
  $use_apc    = 'apc' in $extensions

  class { 'php::package': }

  class { 'php::config':
    use_phpfpm => $use_phpfpm,
    require    => Class['php::package']
  }

  if ($extensions != undef) {
    php::resource::extension { $extensions: }
  }

  if ($use_apc) {
    Php::Resource::Extension['apc'] {
      prefix => 'php-',
    }
  }

  if ($use_phpfpm) {
    Php::Resource::Extension['fpm'] {
      has_service => true,
    }
  }
}