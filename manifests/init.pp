class drone ($wrapper_module_name = 'drone',
  $config_file = 'drone.toml',
  $config_path = '/etc/drone/',
  ){

  class { 'drone::install': }

  class { 'drone::config':
    wrapper_module_name => $wrapper_module_name,
    config_file         => $config_file,
  }
  class { 'drone::service':
    config_path => "${config_path}/${config_file}",
  }

  Class['drone::install'] -> Class['drone::config'] -> Class['drone::service']
}
