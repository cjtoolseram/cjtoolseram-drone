# Class: name
#
#
class drone ( $client_id,
              $client_secret,
              $remote_driver,
              $image_tag = 'latest',
              $expose_port = '80',
              $links,
              $db_type,
              $db_username,
              $db_password,
              $db_url,
              $db_name,
              $db_options,
  ){
  class { 'drone::install': 
    image_tag => $image_tag,
  }

  class { 'drone::service': 
    client_id => $client_id,
    client_secret => $client_secret,
    expose_port => $expose_port,
    links => $links
  }
}
