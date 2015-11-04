# Class: name
#
#
class drone::install ( $image_tag ) {

  file { '/etc/drone':
    ensure => directory,
  }

  file { '/etc/drone/dronerc':
    ensure  => file,
  }

  docker::image { 'drone/drone':
    ensure      => 'present',
    image_tag   => $image_tag,
  }
}