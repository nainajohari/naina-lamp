# === Authors
#
# Author Name <nainajohari379@webkul.com> <k.naina88@gmail.com>
#
# === Copyright
#
# Copyright 2015 naina-lamp


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
 
