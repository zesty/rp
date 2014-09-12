# Implementation of a type conversion module.
#
# Author::    Mike Leary  (mailto:mikeyfinn@gmail.com)
# Copyright:: Copyright (c) 2002 Mike Leary
# License::   Attribution-ShareAlike 2.5 Generic (CC BY-SA 2.5)

# This conversion module only has one method: string_to_integer

module Convert

  INT_INDEX = '0123456789'

  # Convert a well-formatted string to an integer.  If the string
  # contains a '.', it and everything after it will be thrown away.
  # Include up to one leading sign: '+' or '-'.  Whitespace will
  # be removed.  Any badly formatted string will throw an ArgumentError.
  # Good examples: '123', '-123', '+123'
  # Bad examples: '+-123', '-.0', '.9'
  # All strings are assumed to be representations of base-10 numbers.
  def self.string_to_integer(string)
    # truncate all decimal parts
    string.sub!(/\..*/, '')

    # demand more or less tidy input
    unless /^\s*([+-])?\s*(\d{1,})\s*$/ =~ string
      throw ArgumentError
    end
    sign = $1
    string = $2

    sign = sign == '-' ? -1 : 1

    result = 0
    power = 0

    # walk backwards in the string, using index trick + increasing powers
    string.reverse.each_char do |c|
      result += INT_INDEX.index(c) * 10**power
      power += 1
    end

    result * sign
  end

end
