class drone::install {
  docker::image { 'drone/drone':
    ensure      => 'present',
    image_tag   => '0.4',
  }
}
