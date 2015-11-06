# appmgmt_blog: A module to deploy Wordpress using Application Orchestration

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with appmgmt_blog](#setup)
    * [What appmgmt_blog affects](#what-appmgmt_blog-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with appmgmt_blog](#beginning-with-appmgmt_blog)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module integrates three components available in the forge: MySQL, Apache and Wordpress,
into a very simple Application Orchestration workflow.

## Module Description

This module introduces a SQL Capability, which will be configured in Wordpress for the initial
deployment of the blogging platform.

## Setup

### What appmgmt_blog affects

* Installs a number of packages in different servers, mysql-server, mysql, php, httpd, php-mysql, php-gd
* Disables the firewall!! (Warning!).
* Enables MySQL to listen on all interfaces (Warning!).
* Creates a MySQL user for wordpress (with all privileges, and with permissions to login from every host).
* Deploys wordpress on a specified directory.
* Creates a virtualhost.

### Setup Requirements 

Please review the module dependencies on metadata.json.

### Beginning with appmgmt_blog

Define a new site construct in your site.pp, specifying which nodes should run each role.

```puppet
site {
  appmgmt_blog { 'example':
      nodes           => {
        Node['centos6a.pdx.puppetlabs.demo'] => [ Appmgmt_blog::Db[ 'example' ]],
        Node['centos6b.syd.puppetlabs.demo'] => [ Appmgmt_blog::Web[ 'example' ]],
    }
  }
}
```

and then use puppet-job to trigger a run.
## Usage


## Reference

There are two defined types in the modules for the two different server roles in this application.

- Appmgmt_blog::Db is the MySQL Database
- Appmgmt_blog::Web is the Apache Servers running Wordpress
Check the resource is exported on PuppetDB with curl -X GET http://localhost:8080/pdb/query/v4/resources/Sql

## Limitations

This has only been tested on Centos 6.

## Development

Feel free to hack around. This is based on the latest specification of the language (or so I've been told).
