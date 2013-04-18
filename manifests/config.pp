# Class: php::config
#
# This module manages PHP bootstrap and configuration
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
class php::config (
  $use_phpfpm = false,
) inherits php::params {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { $php::params::extra_dir:
    ensure  => directory,
    purge   => true,
    recurse => true,
    force   => true
  }

  if $use_phpfpm {
    file { $php::params::fpm_dir:
      ensure  => directory,
    }

    file { $php::params::fpm_ini:
      ensure  => file,
      content => template('php/php.ini.erb'),
      notify  => Service['php5-fpm']
    }

    file { $php::params::fpm_conf:
      ensure  => file,
      content => template('php/fpm/php-fpm.conf.erb'),
      notify  => Service['php5-fpm']
    }

    file { $php::params::fpm_pool_dir:
      ensure  => directory,
      purge   => true,
      recurse => true,
      force   => true,
      require => File[$php::params::fpm_dir]
    }
  }
}