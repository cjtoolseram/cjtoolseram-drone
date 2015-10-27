# Class: drone::service
#
#
class drone::service {
  
  #file {'droned':
  #  ensure  => file,
  #  path    => '/etc/init.d/droned',
  #  mode    => '0755',
  #  content => template('drone/droned.erb'),
  #}

  service { 'drone':
    ensure => running,
  }

  #File['droned'] -> Service['droned']
}
