# Define: php::resource::pool
#
# This defines a PHP FPM Pool
#
# Parameters:
#   [*user*]
#   [*group*]
#   [*listen*]
#   [*listen_owner*]
#   [*listen_group*]
#   [*listen_mode *]
#   [*listen_allowed_clients*]
#   [*pm*]
#   [*pm_max_children*]
#   [*pm_start_servers*]
#   [*pm_min_spare_servers*]
#   [*pm_max_spare_servers*]
#   [*pm_process_idle_timeout*]
#   [*request_terminate_timeout*]
#   [*security_limit_extensions*]
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#  php::resource::pool { 'www': }
define php::resource::pool (
  $user                      = 'www-data',
  $group                     = 'www-data',
  $listen                    = '/var/run/php5-fpm.sock',
  $listen_owner              = 'www-data',
  $listen_group              = 'www-data',
  $listen_mode               = '0666',
  $listen_allowed_clients    = '127.0.0.1',
  $pm                        = 'dynamic',
  $pm_max_children           = 5,
  $pm_start_servers          = 2,
  $pm_min_spare_servers      = 1,
  $pm_max_spare_servers      = 3,
  $pm_process_idle_timeout   = '10s',
  $request_terminate_timeout = 30,
  $security_limit_extensions = '.php',
  $catch_workers_output      = 'yes',
) {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
    before  => Service['php5-fpm'],
  }

  file { "${name}.conf":
    ensure  => file,
    path    => "${php::params::fpm_pool_dir}/${name}.conf",
    content => template('php/fpm/pool.d.conf.erb'),
  }
}