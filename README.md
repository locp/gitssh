# gitssh

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with gitssh](#setup)
    * [What gitssh affects](#what-gitssh-affects)
    * [Beginning with gitssh](#beginning-with-gitssh)
4. [Usage - Configuration options and additional functionality](#usage)
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
  /var/git/repos
  /var/git/.ssh
  ```

### Beginning with gitssh

As with most modules, the most basic way to use the module would be:

```puppet
include '::gitssh'
```

gitssh::client { 'nick@magpie.puppetlabs.lan':
  key => 'AAAAB...aQ==',
}

gitssh::client { 'fbl42':
  key => 'AAAAB...Aq==',
}

gitssh::client { 'jbi72':
  ensure => absent
}

gitssh::repo { 'foo': }
gitssh::repo { 'bar': }

gitssh::repo { 'deleteme':
  ensure => absent
}

#### Hiera

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

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

Currently only developed and tested on CentOS 7.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.
