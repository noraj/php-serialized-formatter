# frozen_string_literal: false

require 'psf/string_utils'

# PHP serialization library that can parse and generate PHP's serialization
# format including PHP sessions specific format.
#
# Thos module is a patched, modified and enhanced version of
# [jurias/php-serial](https://github.com/jurias/php-serial/blob/master/lib/php-serial.rb)
# (under [MIT license](https://github.com/jurias/php-serial/blob/master/LICENSE)).
module Psf
  # Serializes a ruby object into PHP serialized format.
  # @param var [NilClass|Fixnum|Float|TrueClass|FalseClass|String|Array|Hash|Object]
  # @return [String]
  def self.serialize(var)
    val = ''
    case var.class.to_s
    when 'NilClass'
      val = 'N;'
    when 'Integer', 'Fixnum', 'Bignum'
      val = "i:#{var};"
    when 'Float'
      val = "d:#{var};"
    when 'TrueClass'
      val = 'b:1;'
    when 'FalseClass'
      val = 'b:0;'
    when 'String', 'Symbol'
      val = "s:#{var.to_s.bytesize}:\"#{var}\";"
    when 'Array'
      val = "a:#{var.length}:{"
      var.length.times do |index|
        val += serialize(index) + serialize(var[index])
      end
      val += '}'
    when 'Hash'
      val = "a:#{var.length}:{"
      var.each do |item_key, item_value|
        val += serialize(item_key) + serialize(item_value)
      end
      val += '}'
    else
      klass = var.class.to_s
      val = "O:#{klass.length}:\"#{klass}\":#{var.instance_variables.length}:{"
      var.instance_variables.each do |ivar|
        ivar = ivar.to_s
        ivar.slice!(0)
        val += serialize(ivar) + serialize(var.send(ivar))
      end
      val += '}'
    end
    val
  end

  # Serializes a hash into PHP session.
  # @param hash [Hash]
  # @return [String]
  def self.serialize_session(hash)
    serialized_session = ''
    hash.each do |key, value|
      serialized_session += "#{key}|#{serialize(value)}"
    end
    serialized_session
  end

  # Unserializes a PHP session.
  # @param data [String]
  # @return [Hash]
  def self.unserialize_session(data)
    begin
      data = data.strip
    rescue Encoding::CompatibilityError
      data = data.encode('UTF-8', invalid: :replace, undef: :replace).strip if data.encoding == Encoding::UTF_8
    end
    hash = {}

    until data.empty?
      key = extract_until!(data, '|')
      hash[key] = unserialize!(data)
    end
    hash
  end

  # Unserializes a string up to the first valid serialized instance.
  # @param data [String]
  # @return [NilClass|Fixnum|Float|TrueClass|FalseClass|String|Array|Hash|Object]
  def self.unserialize(data = '')
    unserialize!(data.strip)
  end

  # Unserializes recursively. Consumes the input string.
  # @param data [String]
  # @return [NilClass|Fixnum|Float|TrueClass|FalseClass|String|Array|Hash|Object]
  def self.unserialize!(data = '')
    var_type = data.slice!(0)
    data.slice!(0)
    case var_type
    when 'N'
      value = nil
    when 'b'
      value = (extract_until!(data, ';') == '1')
    when 's'
      length = extract_until!(data, ':').to_i
      extract_until!(data, '"')
      value = data.byteslice!(0, length)
      extract_until!(data, ';')
    when 'i'
      value = extract_until!(data, ';').to_i
    when 'd'
      value = extract_until!(data, ';').to_f
    when 'a'
      value = {}
      length = extract_until!(data, ':').to_i
      extract_until!(data, '{')
      length.times do
        key = unserialize!(data)
        value[key] = unserialize!(data)
      end
      extract_until!(data, '}')
      # if keys are sequential numbers, return array
      value = value.values if (Array(0..(value.length - 1)) == value.keys) && !value.empty?
    when 'O'
      value = {}
      length = extract_until!(data, ':').to_i
      extract_until!(data, '"')
      value['class'] = data.slice!(0, length)
      extract_until!(data, ':')
      length = extract_until!(data, ':').to_i
      extract_until!(data, '{')
      length.times do
        key = unserialize!(data)
        value[key] = unserialize!(data)
      end
    end
    value
  end

  # Return all characters up to the first occurrence of char.
  # Truncates those characters from input string.
  # @param str [String]
  # @param char [String]
  # @return [String]
  def self.extract_until!(str, char)
    extracted = ''
    while (c = str.slice!(0))
      break if c == char

      extracted << c
    end
    extracted
  end
end
