# drone

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Install](#install)
4. [Usage](#usage)
5. [Attributes](#attributes)
6. [Reference](#reference)
7. [Limitations ](#limitations)
8. [Milestones ](#milestones)


## Overview

A Drone CI management module

## Module Description

This module to allow you to install and configure the drone CI. This module uses SQLite3 as it default database and this is a docker container app.

## Install 
~~~
puppet module install cjtoolseram-drone
~~~

You will also need to `include docker` for the managed nodes.

## Usage  
Quick and easy start with a wrapper module!

~~~
# dronewrapper example init.pp
class dronewrapper {
  class { 'drone':
    image_tag     => '0.4',
    remote_driver => 'bitbucket',
    client_id     => 'keykeykeykeykeykey',
    client_secret => 'secretsecretsecretsecretsecret',
  }
}
~~~

`remote_driver`, `client_id` and `client_secret` is needed to connect to remote repository.

You can access Drone by http://your-ip-address 

## Attributes
Attributes for drone class and its default value.

* `image_tag`     = 'latest'
* `remote_driver` = undef
* `client_id`     = undef
* `client_secret` = undef

## Reference
* https://github.com/drone/drone

## Limitations
Only run on any OS that are able to run Docker Engine. This module only runs on SQLite3.

## Milestones
* Adding MySQL docker image as part of the drone ecosystem. 
* Investigate to expand to other DB such as CouchDB

Please help and open issues if there is any bugs.

