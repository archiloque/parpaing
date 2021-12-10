#!/usr/bin/env ruby

require 'set'
require_relative 'color'
require_relative 'part_orientation'
require_relative 'emitter'
require_relative 'part/part'

# @param [Integer] blocks_in_house_blocks
# @param [Integer] width_between_houses
# @param [Integer] min_house_width
# @param [Integer] max_house_width
# @return [Array<Integer>, nil]
def find_houses_list(blocks_in_house_blocks:, width_between_houses:, min_house_width:, max_house_width:)
  houses_list = []
  current_houses_width = 0
  while true
    if (blocks_in_house_blocks - current_houses_width) < min_house_width
      return nil
    elsif (blocks_in_house_blocks - current_houses_width) <= max_house_width
      houses_list << (blocks_in_house_blocks - current_houses_width)
      return houses_list
    else
      house_width = (min_house_width..max_house_width).to_a.sample
      houses_list << house_width
      current_houses_width += house_width + width_between_houses
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

File.open('result.ldr', 'w') do |result|
  result << "0\n"
  space_between_house_and_fence = 2
  fence_width = 1
  usable_blocks_in_cross_baseplates = 3

  straight_baseplates_in_houses_group = 5
  blocks_in_house_blocks = ((usable_blocks_in_cross_baseplates - space_between_house_and_fence - fence_width) * 2) + (Part::BASEPLATE_WIDTH * straight_baseplates_in_houses_group)
  add_lines(
    result,
    Crossroads
      .new
      .create(
        color: Color::DARK_BLUISH_GRAY,
        x: -(Part::BASEPLATE_WIDTH - 3),
        y: 0,
        z: -(Part::BASEPLATE_WIDTH - 3),
      )
  )
  add_lines(
    result,
    RoadTowardZ
      .new
      .create(
        color: Color::DARK_BLUISH_GRAY,
        x: -(Part::BASEPLATE_WIDTH - 3),
        y: 0,
        z: -(Part::BASEPLATE_WIDTH - 3) + Part::BASEPLATE_WIDTH,
      )
  )

  0.upto(straight_baseplates_in_houses_group - 1) do |index|
    add_lines(
      result,
      RoadTowardX
        .new
        .create(
          color: Color::DARK_BLUISH_GRAY,
          x: 3 + (index * RoadTowardX.new.x),
          y: 0,
          z: -(Part::BASEPLATE_WIDTH - 3),
        )
    )
    add_lines(
      result,
      GreenBasePlate
        .new
        .create(
          color: Color::GREEN,
          x: 3 + (index * RoadTowardX.new.x),
          y: 0,
          z: -(Part::BASEPLATE_WIDTH - 3) + Part::BASEPLATE_WIDTH,
        )
    )
  end
  add_lines(
    result,
    Crossroads
      .new
      .create(
        color: Color::DARK_BLUISH_GRAY,
        x: Part::BASEPLATE_WIDTH * straight_baseplates_in_houses_group + 3,
        y: 0,
        z: -(Part::BASEPLATE_WIDTH - 3),
      )
  )
  add_lines(
    result,
    RoadTowardZ
      .new
      .create(
        color: Color::DARK_BLUISH_GRAY,
        x: Part::BASEPLATE_WIDTH * straight_baseplates_in_houses_group + 3,
        y: 0,
        z: -(Part::BASEPLATE_WIDTH - 3) + Part::BASEPLATE_WIDTH,
      )
  )

  fence_from_x = -usable_blocks_in_cross_baseplates
  fence_to_x = (Part::BASEPLATE_WIDTH * straight_baseplates_in_houses_group) - 1
  add_lines(
    result,
    create_fence_between_houses_groups(
      z: (Part::BASEPLATE_WIDTH / 2) + 2,
      from_x: fence_from_x,
      to_x: fence_to_x,
    )
  )
  add_lines(
    result,
    create_fence_between_houses_groups(
      z: (Part::BASEPLATE_WIDTH / 2) + 3,
      from_x: fence_from_x,
      to_x: fence_to_x,
    )
  )

  add_lines(
    result,
    create_fence_between_houses(
      x: 0,
      from_z: (Part::BASEPLATE_WIDTH / 2) + 1,
      to_z: 0,
    )
  )

  houses_list = nil
  until houses_list
    houses_list = find_houses_list(
      blocks_in_house_blocks: blocks_in_house_blocks,
      min_house_width: 6,
      max_house_width: 30,
      width_between_houses: fence_width + (space_between_house_and_fence * 2)
    )
  end

  current_x = fence_width + space_between_house_and_fence
  houses_list.shuffle.each do |house_width|
    add_lines(
      result,
      House.new(
        x_origin: current_x,
        z_origin: 0,
        x_width: house_width,
        z_width: 10,
        height: 6
      ).create()
    )

    current_x += house_width + space_between_house_and_fence

    add_lines(
      result,
      create_fence_between_houses(
        x: current_x,
        from_z: (Part::BASEPLATE_WIDTH / 2) + 1,
        to_z: 0,
      )
    )
    current_x += space_between_house_and_fence + fence_width
    result << "\n"

  end

end
