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
  $base_dir = '/etc/php5/'
  $extra_dir = "${base_dir}extra/"
  $conf_dir = "${base_dir}conf.d/"

  $cli_dir = "${base_dir}cli/"
  $cli_ini = "${cli_dir}php.ini"
  
  $fpm_dir = "${base_dir}fpm/"
  $fpm_pool_dir = "${fpm_dir}pool.d/"
  $fpm_ini = "${fpm_dir}php.ini"
  $fpm_conf = "${fpm_dir}php-fpm.conf"
}