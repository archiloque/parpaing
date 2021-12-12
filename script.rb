#!/usr/bin/env ruby

require 'set'
require_relative 'color'
require_relative 'part_orientation'
require_relative 'emitter'
require_relative 'part/part'

FENCE_WIDTH = 1
SPACE_BETWEEN_HOUSE_AND_FENCE = 2
USABLE_BLOCKS_IN_CROSS_BASEPLATES = 3
STRAIGHT_BASEPLATES_IN_HOUSES_GROUP = 5
BLOCKS_IN_HOUSE_BLOCKS = ((USABLE_BLOCKS_IN_CROSS_BASEPLATES - SPACE_BETWEEN_HOUSE_AND_FENCE - FENCE_WIDTH) * 2) + (Part::BASEPLATE_WIDTH * STRAIGHT_BASEPLATES_IN_HOUSES_GROUP)
WIDTH_BETWEEN_HOUSES = FENCE_WIDTH + (SPACE_BETWEEN_HOUSE_AND_FENCE * 2)

MIN_HOUSE_WIDTH = 6
MAX_HOUSE_WIDTH = 30
HOUSE_DEPTH = 10
HOUSE_HEIGHT = 5

File.open('result.ldr', 'w') do |result|
  result << "0\n"
  HousesBlock.new(
    x_origin: 0,
    z_origin: 0,
    ).create().each do |line|
    result << line
  end
end
