# Class: drone::service
#
#
class drone::service ($config_path) {
  
  file {'droned':
    ensure  => file,
    path    => '/etc/init.d/droned',
    mode    => '0755',
    content => template('drone/droned.erb'),
  }

  service { 'droned':
    ensure => running,
  }

  File['droned'] -> Service['droned']
}
