class drone::service {
  file { '/etc/drone':
    ensure => directory,
  }

  file { '/etc/drone/dronerc':
    ensure => file,
    content => "\nREMOTE_DRIVER=github\n"
  }

  docker::run { 'drone':
    image => 'drone/drone',
    volumes => ['/var/lib/drone:/var/lib/drone', '/var/run/docker.sock:/var/run/docker.sock'],
    env_file => '/etc/drone/dronerc',
    restart_service => true,
    ports => '80:8000',
  }
}
