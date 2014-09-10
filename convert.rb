# Implementation of a type conversion module.
#
# Author::    Mike Leary  (mailto:mikeyfinn@gmail.com)
# Copyright:: Copyright (c) 2002 Mike Leary
# License::   Attribution-ShareAlike 2.5 Generic (CC BY-SA 2.5)

# This conversion module only has one method: string_to_integer

module Convert

  # Convert a well-formatted string to an integer.  If the string
  # contains a '.', it and everything after it will be thrown away.
  # Include up to one leading sign: '+' or '-'.  Whitespace will
  # be removed.  Any badly formatted string will throw an ArgumentError.
  # Good examples: '123', '-123', '+123'
  # Bad examples: '+-123', '-.0', '.9'
  # All strings are assumed to be representations of base-10 numbers.
  def Convert.string_to_integer(s)
    # truncate all decimal parts
    if /\./ =~ s
      s.sub!(/\..*/, '')
    end

    # demand more or less tidy input
    unless /^\s*[+-]?\s*\d{1,}\s*$/ =~ s
      throw ArgumentError
    end
    s.gsub!(/\s/, '')

    sign = 1
    if '-' == s[0] 
      s = s[1..s.length]
      sign = -1
    elsif '+' == s[0]
      s = s[1..s.length]
    end

    result = 0
    power = 0
    lookup = '0123456789'

    # walk backwards in the string, using index trick + increasing powers
    s.reverse.each_char do |c|
      result += lookup.index(c) * 10**power
      power += 1
    end

    result *= sign
  end

end
