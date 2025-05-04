# Usage examples

## CLI

### General help

```
$ psf -h
php-serialized-formatter (psf) v0.0.1

Usage:
  psf unserialize [--session] (--string <string> | --file <file> ) [--format <format>]
  psf -h | --help
  psf --version

Commands:
  unserialize    Unserialize PHP serialized objects

Options:
  --session                       Session mode [default: false]
  -s <string>, --string <string>  Serialized content string, read from STDIN if equal to "-"
  -f <file>, --file <file>        Serialized content file
  --format <format>               Output format (hash, json, json_pretty, yaml) [default: hash]
  --debug                         Display arguments
  -h, --help                      Show this screen
  --version                       Show version

Examples:
  psf unserialize --session -f /var/lib/php/session/sess_3cebqoq314pcnc2jgqiu840h0k
  psf unserialize -s 'O:6:"Person":2:{s:10:"first_name";s:4:"John";s:9:"last_name";s:3:"Doe";}' --format yaml

Project:
  author (https://pwn.by/noraj / https://twitter.com/noraj_rawsec)
  source (https://github.com/noraj/php-serialized-formatter)
  documentation (https://noraj.github.io/php-serialized-formatter)
```

### Examples

```
$ psf unserialize -s 'O:6:"Person":2:{s:10:"first_name";s:4:"John";s:9:"last_name";s:3:"Doe";}' --format json_pretty
{
  "class": "Person",
  "first_name": "John",
  "last_name": "Doe"
}

$ psf unserialize --session -f playground/sess_demo --format yaml
---
userconfig:
  db:
    Console/Mode: collapse
  ts: 1742825705
auth_type: env
```

## Library

```ruby
require 'psf'

class Person
  attr_accessor :first_name, :last_name
end
person = Person.new
person.first_name = 'John'
person.last_name = 'Doe'

Psf.serialize(person) # => 'O:6:"Person":2:{s:10:"first_name";s:4:"John";s:9:"last_name";s:3:"Doe";}'
```
