# Class: drone::service
#
#
class drone::service ($config_path = '/etc/drone/drone.toml') {
  service { 'drone':
    ensure => running,
    flags  => "--config=${config_path}",
  }
}
