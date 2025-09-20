#!/usr/bin/env ruby

require 'open-uri'

firsts = {}
lasts = {}

File.open('unicode.txt', 'w') do |out|
  URI.open(ARGV.first || 'https://unicode.org/Public/UNIDATA/UnicodeData.txt') do |f|
    f.each_line do |l|
      code, name, cat, ccc, bc, cdm, ddv, dv, nv, m, u1name, comment, ucase, lcase, tcase = *l.chomp.split(';', 15)
      if name =~ /<(.*), First>/
        firsts[$1] = code
      elsif name =~ /<(.*), Last>/
        lasts[$1] = code
      else
        name = u1name if name =~ /</ && !u1name.empty?
        character = [code.hex].pack 'U'
        out.puts "#{name}:#{character}"
      end
    end
  end
end
