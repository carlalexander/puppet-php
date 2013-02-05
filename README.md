# PHP Module

Puppet module designed to manage PHP.

## Requirements

Currently only tested using Ubuntu Quantal.

## Setup

To install and bootstrap php, simply add the class defintion:

    class { 'php': }

To setup a new php extension:

    php::resource::extension { 'fpm':
      has_service => true
    }