# Class: name
#
#
class drone ( $client_id = undef,
              $client_secret = undef,
              $remote_driver = undef,
              $image_tag = 'latest',
              $expose_port = '80',
              $links = undef,
              $db_type = 'sqlite3',
              $db_username = undef,
              $db_password = undef,
              $db_host = undef,
              $db_name = undef,
#              $db_options,
  ){
  class { 'drone::install': 
    image_tag => $image_tag,
  }

  class { 'drone::config':
    remote_driver => $remote_driver,
    client_id     => $client_id,
    client_secret => $client_secret,
    db_type       => $db_type,
    db_username   => $db_username,
    db_password   => $db_password,
    db_host       => $db_host,
    db_name       => $db_name,
#    db_options    => $db_options,
  }

  class { 'drone::service': 
    expose_port => $expose_port,
    links => $links
  }
}
