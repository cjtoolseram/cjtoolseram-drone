class drone ($wrapper_module_name = 'drone',
  $config_file = 'drone.toml',
  ){

  class { 'drone::install': }

  class { 'drone::config':
    wrapper_module_name => $wrapper_module_name,
    config_file         => $config_file,
  }
  class { 'drone::service': }

  Class['drone::install'] -> Class['drone::config'] -> Class['drone::service']
}
