# PHP Module

Puppet module designed to manage PHP.

## Requirements

Currently only tested using Ubuntu Quantal.

## Setup

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