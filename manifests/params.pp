# Class: php::params
# 
# This class manages PHP parameters.
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
class php::params {
  $base_dir  = '/etc/php5'
  $extra_dir = "${base_dir}/extra"
  $conf_dir  = "${base_dir}/conf.d"

  $memory_limit           = '128M'
  $short_open_tag         = 'Off'
  $ignore_user_abort      = 'Off'
  $post_max_size          = '15M'
  $upload_max_filesize    = '15M'
  $default_charset        = 'UTF-8'
  $allow_url_fopen        = 'Off'
  $default_socket_timeout = '30'
  $timezone               = 'America/New_York'

  $mysql_allow_persistent = 'Off'
  $pgsql_allow_persistent = 'Off' 
  
  $cli_dir                         = "${base_dir}/cli"
  $cli_ini                         = "${cli_dir}/php.ini"
  
  $fpm_dir                         = "${base_dir}/fpm"
  $fpm_pool_dir                    = "${fpm_dir}/pool.d"
  $fpm_ini                         = "${fpm_dir}/php.ini"
  $fpm_conf                        = "${fpm_dir}/php-fpm.conf"
  $fpm_pid                         = '/var/run/php5-fpm.pid'
  $fpm_error_log                   = '/var/log/php5-fpm.log'
  $fpm_emergency_restart_threshold = 5
  $fpm_emergency_restart_interval  = 2
  $fpm_events_mechanism            = 'epoll'
}