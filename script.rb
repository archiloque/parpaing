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

def find_houses_list()
  houses_list = nil
  until houses_list
    houses_list = find_houses_list_inner()
  end

  houses_list.shuffle.each do |house_width|
    yield(house_width)
  end
end

# @return [Array<Integer>, nil]
def find_houses_list_inner()
  houses_list = []
  current_houses_width = 0
  while true
    if (BLOCKS_IN_HOUSE_BLOCKS - current_houses_width) < MIN_HOUSE_WIDTH
      return nil
    elsif (BLOCKS_IN_HOUSE_BLOCKS - current_houses_width) <= MAX_HOUSE_WIDTH
      houses_list << (BLOCKS_IN_HOUSE_BLOCKS - current_houses_width)
      return houses_list
    else
      house_width = (MIN_HOUSE_WIDTH..MAX_HOUSE_WIDTH).to_a.sample
      houses_list << house_width
      current_houses_width += house_width + WIDTH_BETWEEN_HOUSES
    end
  end
end

# @param [File] file
# @param [Array<String>] lines
# @return [void]
def add_lines(file, lines)
  lines.each do |line|
    file << line
  end
end

# @param [Integer] z
# @param [Integer] from_x
# @param [Integer] to_x
# @return [Array<String>]
def create_fence_between_houses_groups(z:, from_x:, to_x:)
  fence_length = to_x - from_x
  case (fence_length % 4)
  when 0
    current_x = from_x
  when 2
    current_x = from_x + 1
  else
    raise (fence_length % 4).to_s
  end
  result = []
  fence = FenceTowardX.new
  while current_x < to_x
    result.concat(
      fence.create(
        color: Color::WHITE,
        x: current_x,
        y: 0,
        z: z,
      )
    )
    current_x += fence.x
  end
  result
end

# @param [Integer] x
# @param [Integer] from_z
# @param [Integer] to_z
# @return [Array<String>]
def create_fence_between_houses(x:, from_z:, to_z:)
  current_z = from_z
  result = []
  fence = FenceTowardZ.new
  unless (to_z - from_z) % fence.z == 0
    raise "#{(to_z - from_z).to_s} #{fence.z}"
  end
  while current_z - fence.z >= to_z
    result.concat(
      fence.create(
        color: Color::WHITE,
        x: x,
        y: 0,
        z: current_z,
      )
    )
    current_z -= fence.z
  end
  result
end

# @param [File] result
# @param [Integer] x
def create_fence_between_front_facing_houses(result:, x:)
  add_lines(
    result,
    create_fence_between_houses(
      x: x,
      from_z: (Part::BASEPLATE_WIDTH / 2) + 1,
      to_z: 1,
    )
  )
end

# @param [File] result
# @param [Integer] x
def create_fence_between_back_facing_houses(result:, x:)
  add_lines(
    result,
    create_fence_between_houses(
      x: x,
      from_z: (Part::BASEPLATE_WIDTH) + 3,
      to_z: (Part::BASEPLATE_WIDTH / 2) + 3,
    )
  )
end

def create_front_facing_houses(result)
  x = FENCE_WIDTH + SPACE_BETWEEN_HOUSE_AND_FENCE
  find_houses_list do |house_width|
    add_lines(
      result,
      House.new(
        x_origin: x,
        x_width: house_width,
        z_origin: 0,
        z_width: HOUSE_DEPTH,
        height: HOUSE_HEIGHT,
      ).create_front_facing()
    )

    x += house_width + SPACE_BETWEEN_HOUSE_AND_FENCE
    create_fence_between_front_facing_houses(
      result: result,
      x: x,
    )
    x += SPACE_BETWEEN_HOUSE_AND_FENCE + FENCE_WIDTH
    result << "\n"
  end
end

def create_back_facing_houses(result)
  x = FENCE_WIDTH + SPACE_BETWEEN_HOUSE_AND_FENCE
  find_houses_list do |house_width|
    add_lines(
      result,
      House.new(
        x_origin: x,
        x_width: house_width,
        z_origin: Part::BASEPLATE_WIDTH + (2 * USABLE_BLOCKS_IN_CROSS_BASEPLATES) - HOUSE_DEPTH,
        z_width: HOUSE_DEPTH,
        height: HOUSE_HEIGHT,
      ).create_back_facing()
    )

    x += house_width + SPACE_BETWEEN_HOUSE_AND_FENCE
    create_fence_between_back_facing_houses(
      result: result,
      x: x,
    )
    x += SPACE_BETWEEN_HOUSE_AND_FENCE + FENCE_WIDTH
    result << "\n"
  end
end

def create_fences(result)
  # Between houses
  from_x = -USABLE_BLOCKS_IN_CROSS_BASEPLATES
  to_x = (Part::BASEPLATE_WIDTH * STRAIGHT_BASEPLATES_IN_HOUSES_GROUP) - 1
  add_lines(
    result,
    create_fence_between_houses_groups(
      z: (Part::BASEPLATE_WIDTH / 2) + 2,
      from_x: from_x,
      to_x: to_x,
    )
  )
  add_lines(
    result,
    create_fence_between_houses_groups(
      z: (Part::BASEPLATE_WIDTH / 2) + 3,
      from_x: from_x,
      to_x: to_x,
    )
  )

  # Before first houses
  create_fence_between_front_facing_houses(
    result: result,
    x: 0,
  )
  create_fence_between_back_facing_houses(
    result: result,
    x: 0,
  )
end

File.open('result.ldr', 'w') do |result|
  result << "0\n"

  add_lines(
    result,
    Crossroads
      .new
      .create(
        color: Color::DARK_BLUISH_GRAY,
        x: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES),
        y: 0,
        z: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES),
      )
  )
  add_lines(
    result,
    Crossroads
      .new
      .create(
        color: Color::DARK_BLUISH_GRAY,
        x: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES),
        y: 0,
        z: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES) + (2 * Part::BASEPLATE_WIDTH),
      )
  )
  add_lines(
    result,
    RoadTowardZ
      .new
      .create(
        color: Color::DARK_BLUISH_GRAY,
        x: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES),
        y: 0,
        z: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES) + Part::BASEPLATE_WIDTH,
      )
  )

  0.upto(STRAIGHT_BASEPLATES_IN_HOUSES_GROUP - 1) do |index|
    add_lines(
      result,
      RoadTowardX
        .new
        .create(
          color: Color::DARK_BLUISH_GRAY,
          x: USABLE_BLOCKS_IN_CROSS_BASEPLATES + (index * RoadTowardX.new.x),
          y: 0,
          z: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES),
        )
    )
    add_lines(
      result,
      GreenBasePlate
        .new
        .create(
          color: Color::GREEN,
          x: USABLE_BLOCKS_IN_CROSS_BASEPLATES + (index * RoadTowardX.new.x),
          y: 0,
          z: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES) + Part::BASEPLATE_WIDTH,
        )
    )
    add_lines(
      result,
      RoadTowardX
        .new
        .create(
          color: Color::DARK_BLUISH_GRAY,
          x: USABLE_BLOCKS_IN_CROSS_BASEPLATES + (index * RoadTowardX.new.x),
          y: 0,
          z: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES) + (2 * Part::BASEPLATE_WIDTH),
        )
    )
  end
  add_lines(
    result,
    Crossroads
      .new
      .create(
        color: Color::DARK_BLUISH_GRAY,
        x: Part::BASEPLATE_WIDTH * STRAIGHT_BASEPLATES_IN_HOUSES_GROUP + USABLE_BLOCKS_IN_CROSS_BASEPLATES,
        y: 0,
        z: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES),
      )
  )
  add_lines(
    result,
    Crossroads
      .new
      .create(
        color: Color::DARK_BLUISH_GRAY,
        x: Part::BASEPLATE_WIDTH * STRAIGHT_BASEPLATES_IN_HOUSES_GROUP + USABLE_BLOCKS_IN_CROSS_BASEPLATES,
        y: 0,
        z: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES) + (2 * Part::BASEPLATE_WIDTH),
      )
  )
  add_lines(
    result,
    RoadTowardZ
      .new
      .create(
        color: Color::DARK_BLUISH_GRAY,
        x: Part::BASEPLATE_WIDTH * STRAIGHT_BASEPLATES_IN_HOUSES_GROUP + USABLE_BLOCKS_IN_CROSS_BASEPLATES,
        y: 0,
        z: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES) + Part::BASEPLATE_WIDTH,
      )
  )

  create_fences(result)
  create_front_facing_houses(result)
  create_back_facing_houses(result)
end
