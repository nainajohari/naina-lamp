# Naina puppet: LAMP #

This module is to automate LAMP configuration

## Installation

### Puppet

`puppet module install naina-lamp`

### Git Submodule

`git submodule add https://github.com/nainajohari/puppet-lamp.git modules/lamp`

## Usage

### Default setup
Create a manifest that has the following code:
```puppet
Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

include lamp

```
