class drone::install {
  include wget

  $extension = $::osfamily ? {
    'RedHat' => 'rpm',
    'Debian' => 'deb',
    default  => fail('OS not supported!'),
  }

  $install_provider = $::osfamily ? {
    'RedHat' => 'rpm',
    'Debian' => 'dpkg',
    default  => fail('OS not supported!'),
  }

  wget::fetch { 'download installer':
    source      => "http://downloads.drone.io/master/drone.${extension}",
    destination => "/tmp/drone.${extension}",
    timeout     => 0,
    verbose     => false,
  }

  file { "/tmp/drone.${extension}":
    ensure  => file,
    require => Wget::Fetch['download installer'],
  }

  package { 'drone':
    ensure   => installed,
    provider => $install_provider,
    source   => "/tmp/drone.${extension}",
    require  => File["/tmp/drone.${extension}"],
  }
}
