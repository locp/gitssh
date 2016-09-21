# gitssh

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with gitssh](#setup)
    * [What gitssh affects](#what-gitssh-affects)
    * [Beginning with gitssh](#beginning-with-gitssh)
4. [Usage - Configuration options and additional functionality](#usage)
    * [Hiera](#hiera)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

A Puppet module to install a basic Git SSH server.  It also manages SSH client
access and repositories.


## Module Description

This module installs the git package and configures a 'git' user with the
`/usr/bin/git-shell` shell.

SSH clients can be configured using the `gitssh::client` definition and
repositories can be added/removed using the `gitssh::repo` definition.

## Setup

### What gitssh affects

* Adds **/usr/bin/git-shell** to **/etc/shells**.
* By default, the following directory tree is created:

  ```bash
  /var/git
  /var/git/.ssh
  ```

### Beginning with gitssh

As with most modules, the most basic way to use the module would be:

```puppet
include '::gitssh'
```

## Usage

The following code will:

* Setup a Git SSH server with default settings
* Create two clients/users (nick@magpie.puppetlabs.lan and fbl42)
* Ensure that if a client jbi72 does not have access

```puppet
include '::gitssh'

gitssh::client { 'nick@magpie.puppetlabs.lan':
  key => 'AAAAB...aQ==',
}

gitssh::client { 'fbl42':
  key => 'AAAAB...Aq==',
}

gitssh::client { 'jbi72':
  ensure => absent
}
```

The following snippet will create two repositories (foo and bar) and will
ensure that any repository called deleteme is absent:

```puppet
include '::gitssh'

gitssh::repo { 'foo': }
gitssh::repo { 'bar': }

gitssh::repo { 'deleteme':
  ensure => absent
}
```

### Hiera

The following Hiera code will reproduce the examples above:

```YAML
---
gitssh::clients:
  nick@magpie.puppetlabs.lan:
    key: 'AAAAB...aQ=='
  fbl42:
    key: 'AAAAB...Aq=='
  jbi72:
    ensure: absent

gitssh::repos:
  foo:
    ensure: present
  bar:
    ensure: present
  deleteme:
    ensure: absent
```

## Reference

* [Defined type gitssh::client](#defined-type-gitsshclient)
* [Class gitssh](#class-gitssh)
* [Defined type gitssh::repo](#defined-type-gitsshrepo)

### Parameters

#### Defined type gitssh::client

##### `ensure`
If the SSH key is to be present in the git account.  Valid values are
*present* and *absent*.
Default value: **present**

##### `type`
The type of SSH key.  See
[here](https://docs.puppet.com/puppet/latest/reference/types/ssh_authorized_key.html#ssh_authorized_key-attribute-type)
for a list of valid values.
Default value: 'ssh-rsa'

##### `key`
This value can be left as *undef* (the default) if `ensure` is set to
*absent*.  Otherwise it should be the SSH key.
Default value: *undef*

#### Class gitssh

##### `basedir`
This is set as the home directory for the git user.
Default value: '/var/git'

##### `clients`
An array of hashes that can be passed to the `gitssh::client` definition.
Default value: []

##### `package_ensure`
Passed as the **ensure** attribute to the package resource.  Valid
values are **present** or a specific version number.
Default value: **present**

##### `package_name`
Passed as the **name** attribute for the package resource for the git
package.
Default value: 'git'

##### `purge_ssh_keys`
Passed as an attribute for the user resource for git.  This will remove all
SSH keys from the git user that are not controlled by Puppet.  This
attribute has no effect on version of Puppet < 3.6.0 and will generate a
warning unless set to **false**.
Default value: **true**

##### `repos`
An array of hashes that can be passed to the `gitssh::repo` definition.
Default value: []

#### Defined type gitssh::repo

##### `ensure`
If the repository is to be *present* or *absent*.
Default value: **present**

## Limitations

Currently only developed and tested on CentOS 7, Ubuntu 14.04 and Debian 7.

## Development

Contributions will be gratefully accepted.  Please go to the project page,
fork the project, make your changes locally and then raise a pull request.
Details on how to do this are available at
https://guides.github.com/activities/contributing-to-open-source.

### Contributers

| Release        | Issue/PR                                                                            | Contributer                          |
| :------------- | :---------------------------------------------------------------------------------- | :------------------------------------|
| 0.1.2          | [The module does not work on Puppet 3.4.3](https://github.com/locp/gitssh/issues/3) | [@nl0pvm](https://github.com/nl0pvm) |
