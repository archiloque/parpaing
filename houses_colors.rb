#!/usr/bin/env ruby

# Generate all houses color variations
require 'set'
require_relative 'color'
require_relative 'part_orientation'
require_relative 'emitter'
require_relative 'part/part'

File.open('result.ldr', 'w') do |result|
  result << "0\n"
  x = 0
  House::HOUSE_COLORS.keys.each do |walls_color|
    House::HOUSE_COLORS[walls_color].each do |door_and_windows_color|
      house = House.new(
        x_origin: x,
        x_width: HousesBlock::MIN_HOUSE_WIDTH,
        z_origin: 0,
        z_width: HousesBlock::HOUSE_DEPTH,
        height: HousesBlock::HOUSE_HEIGHT,
        walls_color: walls_color,
        door_and_windows_color: door_and_windows_color,
        )
      house.create_front_facing()
      house.result.each do |line|
          result << line
      end

      x += HousesBlock::MIN_HOUSE_WIDTH + 2
    end
  end
end
