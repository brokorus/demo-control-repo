class profile::k8-apache {
  class { '::apache':
    default_vhost  => false,
    service_manage => false,
    use_systemd    => false,
    apache_port => false,
  }
  
  apache::vhost { 'localhost':
    port    => $apache_port,
    docroot => '/var/www/html',
  }
  
  file { '/var/www/html/index.html':
    ensure  => present,
    content => 'Hello World',
  }
}
