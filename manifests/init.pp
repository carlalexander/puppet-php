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

  if $extension {
    php::resource::extension { $extensions: }
  }
}