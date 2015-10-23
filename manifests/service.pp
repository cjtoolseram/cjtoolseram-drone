# Class: drone::service
#
#
class drone::service ($config_path = '/etc/drone/drone.toml') {
	exec { "nohup droned --config=${config_path} &":
		path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
		#refreshonly => true,
	}
}