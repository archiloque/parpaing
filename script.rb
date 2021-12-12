#!/usr/bin/env ruby

require 'set'
require_relative 'color'
require_relative 'part_orientation'
require_relative 'emitter'
require_relative 'part/part'

File.open('result.ldr', 'w') do |result|
  result << "0\n"
  delta_along_x = Part::BASEPLATE_WIDTH * (HousesBlock::STRAIGHT_BASEPLATES_IN_HOUSES_GROUP + 1)
  delta_along_z = Part::BASEPLATE_WIDTH * 2
  0.upto(5) do |x_index|
    0.upto(10) do |z_index|
      HousesBlock.new(
        x_origin: x_index * delta_along_x,
        z_origin: z_index * delta_along_z,
      ).create().each do |line|
        result << line
      end
    end
  end
end
