define appmgmt_blog::db (
  $dbuser,
  $dbpass,
  $host = $::fqdn,
  ){
   $override_options = {
     'mysqld' => {
       'bind-address' => '0.0.0.0',
     }
   }
   service { 'iptables':
      ensure => stopped,
      enable => false,
    }
    class {'::mysql::server':
      root_password    => 'whatever',
      override_options => $override_options,
    }
    mysql::db { $name:
      user     => $dbuser,
      password => $dbpass,
      host     => '%',
      grant    => ['ALL PRIVILEGES'],
    }
  }
  Appmgmt_blog::Db produces Sql {
    dbuser => $dbuser,
    dbpass => $dbpass,
    dbhost => $host,
    dbname => $name,
  }
