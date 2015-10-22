class drone::install {
  include wget

  $extension = $osfamily ? {
  	'RedHat' => 'rpm',
  	'Debian' => 'deb',
  	default  => fail('OS not supported!'),
  }

  wget::fetch { 'download installer':
    source      => "http://downloads.drone.io/master/drone.${extension}",
    destination => "/tmp/drone.${extension}",
    timeout     => 0,
    verbose     => false,
  }

  package { 'drone':
  	ensure => installed,
  	source => "/tmp/drone.${extension}"
  }

  Wget::Fetch['download installer'] -> Package['drone']
}
