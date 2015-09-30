# == Class: lamp
#
# Full description of class lamp here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'lamp':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <nainajohari379@webkul.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#

class lamp {

#execute 'apt-get update'
        exec { 'apt-update' :
               command => '/usr/bin/apt-get update',
               before => Package['apache2'],
             }

#install apache2 package
        package { 'apache2' :
                  ensure => latest,
                 require => exec['apt-update'],
                }

#ensure apache2 service is running
          service { 'apache2' :
                   ensure => running,
                   require => Package['apache2'],
                   }


#install mysql-server package
           package { 'mysql-server' :
                    ensure => latest,
                   }

#ensure mysql service is running
          service { 'mysql' :
                   ensure => running,
                   require => Package['mysql-server'],
                  }


# install php5 package
           package { 'php5' :
                    ensure => latest,
                   }

# ensure info.php file exists
  file { '/var/www/html/info.php':
          ensure => file,
          content => '<?php  phpinfo(); ?>',
         require => Package['apache2'],
       }
 
}
 
