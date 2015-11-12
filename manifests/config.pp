# Class: name
#
#
class drone::config ( $remote_driver,
                      $client_id,
                      $client_secret,
                      $db_type,
                      $db_username,
                      $db_password,
                      $db_host,
                      $db_name,
#                      $db_options,
  ) {
  case $remote_driver {
    'github': { $remote_config = "https://github.com?client_id=${client_id}&client_secret=${client_secret}" }
    'bitbucket': { $remote_config = "https://bitbucket.org?client_id=${client_id}&client_secret=${client_secret}" }
    'gogs': { $remote_config = "https://gogs.hooli.com?open=false" }
    'gitlab': { $remote_config = "https://gitlab.hooli.com?client_id=${client_id}&client_secret=${client_secret}" }
    default: { fail("${remote_driver} is not supported!") }
  }

  file_line {'remote-driver':
    ensure    => 'present',
    line      => "REMOTE_DRIVER=${remote_driver}",
    path      => '/etc/drone/dronerc',
    after     => "REMOTE_CONFIG=${remote_config}",
    match     => '/REMOTE_DRIVER=*/', 
    replace   => true,   
  }

    file_line {'remote-config':
    ensure    => 'present',
    line      => "REMOTE_CONFIG=${remote_config}",
    path      => '/etc/drone/dronerc',
    after     => "REMOTE_DRIVER=${remote_driver}",
    match     => '/REMOTE_CONFIG=*/', 
    replace   => true,   
  }

  case $db_type {
    'sqlite3': { $db_config = '/var/lib/drone/drone.sqlite' }
    'mysql': { $db_config = "${db_username}:${db_password}@tcp(${db_host})/${db_name}?parseTime=true" }
    'postgres': { $db_config = "postgres://${db_username}:${db_password}@${db_host}/${db_name}  " }
    default: { fail("${db_type} is not supported!") }
  }

  file_line {'database-driver':
    ensure    => 'present',
    line      => "DATABASE_DRIVER=${db_type}",
    path      => '/etc/drone/dronerc',
    after     => "DATABASE_CONFIG=${db_config}",
    match     => '/DATABASE_DRIVER=*/', 
    replace   => true,   
  }

  file_line {'database-config':
    ensure    => 'present',
    line      => "DATABASE_CONFIG=${db_config}",
    path      => '/etc/drone/dronerc',
    after     => "DATABASE_DRIVER=${db_type}",
    match     => '/DATABASE_CONFIG=*/', 
    replace   => true,   
  }
}