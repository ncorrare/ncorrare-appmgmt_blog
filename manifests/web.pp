define appmgmt_blog::web (
  $webpath,
  $vhost,
  $dbuser,
  $dbpass,
  $dbhost,
  $dbname,
  ) {
    package {['php','mysql','php-mysql','php-gd']:
      ensure => installed,
    }
    service { 'iptables':
      ensure => stopped,
      enable => false,
    }

    class { '::apache':
    }
    apache::vhost { $vhost:
      port    => '80',
      docroot => $webpath,
      require => [File[$webpath]],
    }
    class {'::apache::mod::php': }
    file { $webpath:
      ensure => directory,
      owner => 'apache',
      group => 'apache',
      require => Package['httpd'],
    }
    class { '::wordpress':
      db_user        => $dbuser,
      db_password    => $dbpass,
      db_host        => $dbhost,
      db_name        => $dbname,
      create_db      => false,
      create_db_user => false,
      install_dir    => $webpath,
      wp_owner    => 'apache',
      wp_group    => 'apache',
    }
  }
  Appmgmt_blog::Web consumes Sql {

  }
