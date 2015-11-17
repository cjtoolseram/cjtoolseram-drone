# Class: name
#
#
class drone ( $client_id = undef,
              $client_secret = undef,
              $remote_driver = undef,
              $image_tag = 'latest',
              $expose_port = '80',
  ){
  class { 'drone::install': 
    image_tag => $image_tag,
  }

  class { 'drone::config':
    remote_driver => $remote_driver,
    client_id     => $client_id,
    client_secret => $client_secret,
  }

  class { 'drone::service': 
    expose_port => $expose_port,
  }
}
