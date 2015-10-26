# Class: drone::config
#
#
class drone::config ($wrapper_module_name,
  $config_file){

  file { 'drone.toml':
    ensure => file,
    mode   => '0644',
    source => "puppet:///modules/${wrapper_module_name}/${config_file}",
    path   => "/etc/drone/${config_file}",
  }
}
