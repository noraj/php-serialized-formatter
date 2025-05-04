# frozen_string_literal: true

# Extending String class with new methods
class String
  # In place version of String#byteslice(index, length)
  def byteslice!(start_index, length = nil)
    byte_start_index = start_index
    byte_length = length || (bytesize - byte_start_index)

    byte_start_index = bytesize + byte_start_index if byte_start_index.negative?
    return nil if byte_start_index.negative? || byte_start_index >= bytesize

    byte_length = bytesize - byte_start_index if byte_start_index + byte_length > bytesize

    out = byteslice(byte_start_index, byte_length)
    replace(byteslice(0, byte_start_index) + byteslice(byte_start_index + byte_length..-1))
    out
  end
end
