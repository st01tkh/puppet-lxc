# vagrant_lxc

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with vagrant_lxc](#setup)
    * [What vagrant_lxc affects](#what-vagrant_lxc-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with vagrant_lxc](#beginning-with-vagrant_lxc)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This puppet module prepares host to use vagrant-lxc plugin (https://github.com/fgrehm/vagrant-lxc)
It sets up latest vagrant, vagrant-lxc plugin, lxc and appropriate dependencies

## Module Description

## Setup

### What vagrant_lxc affects

* Install lxc, redir, brctl, lxc lxc-templates cgroup-lite redir
* Install the latest vagrant
* Install vagrant-lxc plugin 

### Setup Requirements **OPTIONAL**

This module requires Linux host (now tested only with Ubuntu Trusty)

### Beginning with vagrant_lxc

## Usage

## Reference

## Limitations


LXC runs only on Linux (kernel != 3.5.0-17.28)
This module requires Linux host (now tested only with Ubuntu Trusty)

## Development

## Release Notes/Contributors/Etc **Optional**
