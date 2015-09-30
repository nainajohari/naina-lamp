# Naina puppet: LAMP #
## Overview
This module is to automate LAMP configuration on ubuntu-14.04,12.04

## Module Description
A handy puppet module for managing LAMP configuration.
Before you go ahead with this module, make sure that you have puppet master and agent installed on your host machines and agent contains a certificate signed by the puppet master.
All you need to do is to get this module installed either from github or from puppetforge.

Puppet version >=3.4.0 is recommended.


## Installation

### Puppet

`puppet module install naina-lamp`

### Git Submodule

`git submodule add https://github.com/nainajohari/puppet-lamp.git modules/lamp`

## Usage

### Default setup
Create a manifest that has the following code [/etc/puppet/manifests/site.pp] :
```puppet
Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

node default {
             include lamp
             }
```
