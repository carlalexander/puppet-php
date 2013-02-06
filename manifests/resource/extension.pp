# Define: php::resource::extension
#
# This defines a PHP extension
#
# Parameters:
#   [*prefix*]      - Extension prefix
#   [*has_service*] - Flag if extension runs as a service
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#  php::resource::extension { 'curl': }
define php::resource::extension (
  $prefix      = 'php5-',
  $has_service = false
) {
  package { "php-${name}":
    ensure  => latest,
    name    => "${prefix}${name}",
    notify  => Class['php::config']
  }

  if $has_service {
    service { "php5-${name}":
      ensure     => running,
      enable     => true,
      hasstatus  => true,
      hasrestart => true,
      require    => Package["php-${name}"]
    }
  }
}