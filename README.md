# drone

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
4. [Usage](#usage)
5. [Attributes](#attributes)
6. [Reference](#reference)
7. [Limitations ](#limitations)


## Overview

A Drone CI management module

## Module Description

This module to allow you to install and configure the drone CI

## Setup 
~~~
puppet module install cjtoolseram-drone
~~~

## Usage
Easy start with Drone CI
~~~
include drone
~~~

You can find the config is in `/etc/drone/drone.toml` and this is the default value for `config_path`.  

Default database setting will use SQLite3.

To have a specific configuration, you will need to copy the config file from [here](https://github.com/drone/drone/blob/master/packaging/root/etc/drone/drone.toml) and put it in your wrapper module files directory `$basemodulepath/your_module/files`.

~~~
# Specify different config
class { 'drone::config':
  wrapper_module_name => 'your_module',
  config_file         => 'your_drone.toml',
}

# Start service with different config
class { 'drone::service':
  config_path => '/etc/drone/your_drone_config.toml',
}
~~~

**Note**: The current default port for Drone CI Server is set to 8080 in this module. You can access Drone by http://your-ip-address:8080 

## Attributes
* `drone::config`
  * wrapper_module_name - your module name that use this module
  * config_file - name of the config file

* `drone::service`
  * config_path - path to your config file in your node

## Reference
* https://github.com/drone/drone

## Limitations

Only support Redhat or Debian osfamily type

**NOTE:** You will need GLIBC 2.14 to run Drone CI

