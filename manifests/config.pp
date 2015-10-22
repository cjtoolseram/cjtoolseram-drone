# Class: drone::config
#
#
class drone::config ($server_port                    = ":80",
	                 $server_ssl_key                 = "",
	                 $server_ssl_cert                = "",
	                 $session_secret                 = "",
	                 $session_expires                = "",
	                 $database_driver                = "",
	                 $database_datasource            = "",
	                 $github_client                  = "",
	                 $github_secret                  = "",
	                 $github_orgs                    = [],
	                 $github_open                    = "false",
	                 $github_enterprise_client       = "",
	                 $github_enterprise_secret       = "",
	                 $github_enterprise_api          = "",
	                 $github_enterprise_url          = "",
	                 $github_enterprise_orgs         = [],
	                 $github_enterprise_private_mode = "false",
	                 $github_enterprise_open         = "false",
	                 $bitbucket_client               = "",
	                 $bitbucket_secret               = "",
	                 $bitbucket_open                 = "false",
	                 $gitlab_url                     = "",
	                 $gitlab_client                  = "",
	                 $gitlab_secret                  = "",
	                 $gitlab_skip_verify             = "false",
	                 $gitlab_open                    = "false",
	                 $gogs_url                       = "",
	                 $gogs_secret                    = "",
	                 $gogs_open                      = "false",
	                 $smtp_host                      = "",
	                 $smtp_port                      = "",
	                 $smtp_from                      = "",
	                 $smtp_user                      = "",
	                 $smtp_pass                      = "",
	                 $docker_cert                    = "",
	                 $docker_key                     = "",
	                 $worker_nodes                   = ["unix:///var/run/docker.sock",
                                                        "unix:///var/run/docker.sock"],
	                 ){

  file { 'drone.toml':
  	ensure => file,
  	path   => '/etc/drone/drone.toml',
  }

  Ini_setting {
  	ensure         => present,
  	path           => '/etc/drone/drone.toml',
  	section_prefix => '[',
    section_suffix => ']',
    require        => File['drone.toml'],
  }

  ini_setting { 'server_port':
    section => 'server',
    setting => 'port',
    value   => $port,
  }

  ini_setting { 'server_ssl_key':
    section => 'server',
    setting => 'key',
    value   => $server_ssl_key,
  }

  ini_setting { 'server_ssl_cert':
    section => 'server',
    setting => 'cert',
    value   => $server_ssl_cert,
  }

  ini_setting { 'session_secret':
    section => 'session',
    setting => 'secret',
    value   => $session_secret,
  }

  ini_setting { 'session_expires':
    section => 'session',
    setting => 'expires',
    value   => $session_expires,
  }

  ini_setting { 'database_driver':
    section => 'database',
    setting => 'driver',
    value   => $database_driver,
  }

  ini_setting { 'database_datasource':
    section => 'database',
    setting => 'datasource',
    value   => $database_datasource,
  }

  ini_setting { 'github_client':
    section => 'github',
    setting => 'client',
    value   => $github_client,
  }

  ini_setting { 'github_secret':
    section => 'github',
    setting => 'secret',
    value   => $github_secret,
  }

  ini_setting { 'github_orgs':
    section => 'github',
    setting => 'orgs',
    value   => $github_orgs,
  }

  ini_setting { 'github_open':
    section => 'github',
    setting => 'open',
    value   => $github_open,
  }

  ini_setting { 'github_enterprise_client':
    section => 'github_enterprise',
    setting => 'client',
    value   => $github_enterprise_client,
  }

  ini_setting { 'github_enterprise_secret':
    section => 'github_enterprise',
    setting => 'secret',
    value   => $github_enterprise_secret,
  }

  ini_setting { 'github_enterprise_api':
    section => 'github_enterprise',
    setting => 'api',
    value   => $github_enterprise_api,
  }

  ini_setting { 'github_enterprise_url':
    section => 'github_enterprise',
    setting => 'url',
    value   => $github_enterprise_url,
  }

  ini_setting { 'github_enterprise_orgs':
    section => 'github_enterprise',
    setting => 'orgs',
    value   => $github_enterprise_orgs,
  }

  ini_setting { 'github_enterprise_private_mode':
    section => 'github_enterprise',
    setting => 'private_mode',
    value   => $github_enterprise_private_mode,
  }

  ini_setting { 'github_enterprise_open':
    section => 'github_enterprise',
    setting => 'open',
    value   => $github_enterprise_open,
  }

  ini_setting { 'bitbucket_client':
    section => 'bitbucket',
    setting => 'client',
    value   => $bitbucket_client,
  }

  ini_setting { 'bitbucket_secret':
    section => 'bitbucket',
    setting => 'secret',
    value   => $bitbucket_secret,
  }

  ini_setting { 'bitbucket_open':
    section => 'bitbucket',
    setting => 'open',
    value   => $bitbucket_open,
  }

  ini_setting { 'gitlab_client':
    section => 'gitlab',
    setting => 'client',
    value   => $gitlab_open,
  }

  ini_setting { 'gitlab_url':
    section => 'gitlab',
    setting => 'url',
    value   => $gitlab_url,
  }

  ini_setting { 'gitlab_secret':
    section => 'gitlab',
    setting => 'secret',
    value   => $gitlab_secret,
  }

  ini_setting { 'gitlab_skip_verify':
    section => 'gitlab',
    setting => 'skip_verify',
    value   => $gitlab_skip_verify,
  }

  ini_setting { 'gitlab_open':
    section => 'gitlab',
    setting => 'open',
    value   => $gitlab_open,
  }

  ini_setting { 'gogs_url':
    section => 'gogs',
    setting => 'url',
    value   => $gogs_url,
  }

  ini_setting { 'gogs_secret':
    section => 'gogs',
    setting => 'secret',
    value   => $gogs_secret,
  }

  ini_setting { 'gogs_open':
    section => 'gogs',
    setting => 'open',
    value   => $gogs_open,
  }

  ini_setting { 'smtp_host':
    section => 'smtp',
    setting => 'host',
    value   => $smtp_host,
  }

  ini_setting { 'smtp_port':
    section => 'smtp',
    setting => 'port',
    value   => $smtp_port,
  }

  ini_setting { 'smtp_from':
    section => 'smtp',
    setting => 'from',
    value   => $smtp_from,
  }

  ini_setting { 'smtp_user':
    section => 'smtp',
    setting => 'user',
    value   => $smtp_user,
  }

  ini_setting { 'smtp_pass':
    section => 'smtp',
    setting => 'pass',
    value   => $smtp_pass,
  }

  ini_setting { 'docker_cert':
    section => 'docker',
    setting => 'cert',
    value   => $docker_cert,
  }

  ini_setting { 'docker_key':
    section => 'docker',
    setting => 'key',
    value   => $docker_key,
  }

  ini_setting { 'worker_nodes':
    section => 'worker',
    setting => 'nodes',
    value   => $worker_nodes,
  }
}