#!/usr/bin/env ruby
# frozen_string_literal: true

require 'open-uri'

firsts = {}
lasts = {}

File.open('unicode.txt', 'w') do |out|
  URI.parse(ARGV.first || 'https://unicode.org/Public/UNIDATA/UnicodeData.txt').open do |f|
    f.each_line do |l|
      code, name, _, _, _, _, _, _, _, _, u1name, = *l.chomp.split(';', 15)
      if name =~ /<(.*), First>/
        firsts[Regexp.last_match(1)] = code
      elsif name =~ /<(.*), Last>/
        lasts[Regexp.last_match(1)] = code
      else
        name = u1name if name =~ /</ && !u1name.empty?
        character = [code.hex].pack 'U'
        out.puts "#{name}:#{character}"
      end
    end
  end
end
