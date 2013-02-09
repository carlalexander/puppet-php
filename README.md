# PHP Module

Puppet module designed to manage PHP.

## Requirements

Currently only tested using Ubuntu Quantal.

## Usage

To install and bootstrap php, simply add the class defintion:

    class { 'php': }

To setup a new php extension, you may do it within the class: 

  class { 'php':
    extensions => ['gd']
  }

Or, you may use an extension defintion:

    php::resource::extension { 'fpm':
      has_service => true
    }

You may also define a list of extension, by using an array:

    php::resource::extension { ['gd', 'cli', 'curl', 'mysql']: }

Adding a new FPM pool is done using a specific definition:

    php::resource::pool { 'www':
      pm_max_children         => 50,
      pm_start_servers        => 15,
      pm_min_spare_servers    => 5,
      pm_max_spare_servers    => 25,
      pm_process_idle_timeout => '60s'
    }