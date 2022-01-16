#!/usr/bin/env ruby

# WIP
require 'set'
require_relative 'color'
require_relative 'part_orientation'
require_relative 'emitter'
require_relative 'units/units'
require_relative 'part/part'
include Measures

File.open('result.ldr', 'w') do |result|
  result << "0\n"
  source_map = File.readlines('map.txt', chomp: true)
  parsed_dimension = /\A(?<columns>\d+)x(?<lines>\d+)\z/.match(source_map[0])
  if parsed_dimension.nil?
    raise "Invalid size [#{source_map[0]}]"
  end
  lines_number = parsed_dimension['lines'].to_i
  columns_number = parsed_dimension['columns'].to_i
  unless source_map.length > lines_number
    raise "Not enough lines: #{source_map.length - 1} vs #{lines_number}"
  end
  result_map = Array.new()
  0.upto(lines_number - 1) do |line_number|
    current_line = source_map[line_number + 1]
    if current_line.length > columns_number
      raise "Bad line length: [#{current_line}] #{current_line.length} vs #{columns_number}"
    else
      current_line = current_line.ljust(columns_number, ' ')
    end
    result_map << current_line.chars.map do |element|
      case element
      when ' '
        false
      when '#'
        true
      else
        raise "[#{element}]"
      end
    end
  end
  Level.new(columns_number, lines_number,result_map).create.each do |line|
    result << line
  end
end
