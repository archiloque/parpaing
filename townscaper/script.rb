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
  Standard.new(
    x_origin: 0.to_u,
    y_origin: 0.to_u,
    z_origin: 0.to_u,
  ).create.each do |line|
    result << line
  end
end
