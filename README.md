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

Configuring Drone CI example config:
~~~
# Using PostgreSQL example
class {'drone::config':
  database-driver     -> "postgres",
  database-datasource -> "host-127.0.0.1 user-postgres dbname-drone sslmode-disable",
}

# Using MySQL example
class {'drone::config':
  database-driver     -> "mysql",
  database-datasource -> "root@tcp(127.0.0.1:3306)/drone",
}

# Start up drone with different config path
class {'drone::service':
	config_path -> '/path/to/new/config',
}
~~~

Note that if there is no database configured, it will use SQLite.

## Attributes
The configuration attributes and its default value.
  * server_port                    - ":80"
  * server_ssl_key                 - ""
  * server_ssl_cert                - ""
  * session_secret                 - ""
  * session_expires                - ""
  * database_driver                - ""
  * database_datasource            - ""
  * github_client                  - ""
  * github_secret                  - ""
  * github_orgs                    - []
  * github_open                    - "false"
  * github_enterprise_client       - ""
  * github_enterprise_secret       - ""
  * github_enterprise_api          - ""
  * github_enterprise_url          - ""
  * github_enterprise_orgs         - []
  * github_enterprise_private_mode - "false"
  * github_enterprise_open         - "false"
  * bitbucket_client               - ""
  * bitbucket_secret               - ""
  * bitbucket_open                 - "false"
  * gitlab_url                     - ""
  * gitlab_client                  - ""
  * gitlab_secret                  - ""
  * gitlab_skip_verify             - "false"
  * gitlab_open                    - "false"
  * gogs_url                       - ""
  * gogs_secret                    - ""
  * gogs_open                      - "false"
  * smtp_host                      - ""
  * smtp_port                      - ""
  * smtp_from                      - ""
  * smtp_user                      - ""
  * smtp_pass                      - ""
  * docker_cert                    - ""
  * docker_key                     - ""
  * worker_nodes

## Reference
* https://github.com/drone/drone

## Limitations

Only support Redhat or Debian osfamily type


