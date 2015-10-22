# Class: drone
#
#
class drone {
	class { '::drone::install': } ->
	class { '::drone::config': } ->
	class { '::drone::service': }
}