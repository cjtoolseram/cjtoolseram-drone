# Class: name
#
#
class drone::service ( $expose_port,
  ){
  docker::run { 'drone':
    image           => 'drone/drone',
    volumes         => ['/var/lib/drone:/var/lib/drone', '/var/run/docker.sock:/var/run/docker.sock'],
    env_file        => '/etc/drone/dronerc',
    ports           => "${expose_port}:8000",
    restart_service => true,
  }
}