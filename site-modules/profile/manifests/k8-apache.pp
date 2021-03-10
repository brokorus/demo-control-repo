class profile::k8-apache {
  class { '::apache':
    default_vhost  => false,
    service_manage => false,
    use_systemd    => false,
    apache_port => 80,
  }
  
  apache::vhost { 'localhost':
    port    => $apache_port,
    docroot => '/var/www/html',
  }

  firewall { '100 allow http and https access':
    dport  => [$apache_port, 443],
    proto  => 'tcp',
    action => 'accept',
  }
  
  file { '/var/www/html/index.html':
    ensure  => present,
    content => 'Hello World',
  }
}
