# Class: name
#
#
class drone::config ( $remote_driver,
                      $client_id,
                      $client_secret,
  ) {
  case $remote_driver {
    'github': { $remote_config = "https://github.com?client_id=${client_id}&client_secret=${client_secret}" }
    'bitbucket': { $remote_config = "https://bitbucket.org?client_id=${client_id}&client_secret=${client_secret}" }
    'gogs': { $remote_config = 'https://gogs.hooli.com?open=false' }
    'gitlab': { $remote_config = "https://gitlab.hooli.com?client_id=${client_id}&client_secret=${client_secret}" }
    default: { fail("${remote_driver} is not supported!") }
  }

  file_line {'remote-driver':
    ensure  => 'present',
    line    => "REMOTE_DRIVER=${remote_driver}",
    path    => '/etc/drone/dronerc',
    match   => '^REMOTE_DRIVER\=',
    replace => true,
  }

  file_line {'remote-config':
    ensure  => 'present',
    line    => "REMOTE_CONFIG=${remote_config}",
    path    => '/etc/drone/dronerc',
    after   => "REMOTE_DRIVER=${remote_driver}",
    match   => '^REMOTE_CONFIG\=',
    replace => true,
  }
}
