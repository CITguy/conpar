# Conpar
[![Gem Version](https://badge.fury.io/rb/conpar.svg)](http://badge.fury.io/rb/conpar)
[![Build Status](https://travis-ci.org/CITguy/conpar.png?branch=master)](https://travis-ci.org/CITguy/conpar)
[![Coverage Status](https://coveralls.io/repos/CITguy/conpar/badge.png?branch=master)](https://coveralls.io/r/CITguy/conpar?branch=master)
[![Dependency Status](https://gemnasium.com/CITguy/conpar.svg)](https://gemnasium.com/CITguy/conpar)

Conpar (short for Configuration Parser) is designed to be a flexible and extendable library for parsing through a Firewall configuration file by tokenizing the configuration directives into ruby objects for evaluation.

**NOTE**: This gem is still in a very _alpha_ state.  It currently only knows how to tokenize Comments and Access Lists for Cisco ASA and Cisco PIX firewall configurations.

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
Since 1.8.7 and ree are EOL, they no longer desirable to code against. Ruby 1.9.2 will not be used due to some incompatibilities.

## Usage

    Conpar::Document.parse(config_string) #=> Array

The returned array will have parsed every line in the configuration string into Conpar::Directive (or descendant) objects.

## Configuration
**NOTE:** While configuration _is_ functional, it is **not** advised to do any configuration for the current version of this gem.

## CHANGELOG
### 0.2.2/0.2.3
* Updated to add legacy `access-list` syntax support (0.2.2)
  * This includes version 6.3 and earlier of the ASA/PIX devices.
* Updated specs for RSpec 3.x compatibility (0.2.3)

### 0.2.0
* Minor version bumped due to potentially breaking change in functionality.
* Changes
	* Directive line_number now returns a string that is in the same encoding as the line it refers.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

