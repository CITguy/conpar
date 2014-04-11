# Conpar 
[![Build Status](https://travis-ci.org/CITguy/conpar.png?branch=master)](https://travis-ci.org/CITguy/conpar)
[![Coverage Status](https://coveralls.io/repos/CITguy/conpar/badge.png)](https://coveralls.io/r/CITguy/conpar)

Conpar (short for **Con**figuration **Par**ser) is designed to be a flexible and extendable library for parsing through a Firewall configuration file by tokenizing the configuration directives into ruby objects for evaluation.

**NOTE**: This gem is still in a very _alpha_ state.  It currently only knows how to tokenize Comments and Access Lists for Cisco ASA firewall configurations.

## Installation

Add this line to your application's Gemfile:

    gem 'conpar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install conpar

## Supported Rubies

**MRE 1.9.3, 2.0.0, 2.1.0**

Versions prior to 1.9.3 will **NOT** be supported with this gem.
Since 1.8.7 and ree are EOL, they no longer desirable to code against. Also, there are some incompatibilities with ruby 1.9.2.

## Usage

    Conpar::Document.parse(config_string) #=> Array

The returned array will have parsed every line in the configuration string into Conpar::Directive (or descendant) objects.

## Configuration
**NOTE:** While configuration _is_ functional, it is **not** advised to do any configuration for the current version of this gem.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
