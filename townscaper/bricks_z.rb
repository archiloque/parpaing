#!/usr/bin/env ruby

# WIP
require 'set'
require_relative 'color'
require_relative 'part_orientation'
require_relative 'emitter'
require_relative 'part/part'
include Measures

File.open('result.ldr', 'w') do |result|
  result << "0\n"
  current_x = 0
  Brick::BY_SIZE_Z.keys.sort.each do |size|
    Brick::BY_SIZE_Z[size].new.
      create(
        color: Color::BLUE,
        x: current_x.to_m,
        y: 0.to_m,
        z: 0.to_m,
      ).each do |line|
      result << line
    end
    current_x += (2 * Measures::BRICK_WIDTH)
  end
end
