#!/usr/bin/env ruby

# 30055 Fence Spindled 1 x 4 x 2
require 'set'
require_relative 'color'
require_relative 'orientation'
require_relative 'emitter'
require_relative 'part/part'

class House
  POSSIBLE_COLORS = [
    Color::BLUE,
    Color::RED,
    Color::YELLOW,
    Color::WHITE,
    Color::LIGHT_GRAY,
    Color::DARK_TURQUOISE,
  ].freeze

  # @param [Integer] x_origin
  # @param [Integer] z_origin
  # @param [Integer] x_width
  # @param [Integer] z_width
  # @param [Integer] height
  def initialize(x_origin:, z_origin:, x_width:, z_width:, height:)
    @x_origin = x_origin
    @z_origin = z_origin
    @x_width = x_width
    @z_width = z_width
    @height = height
    @occupied_bricks = Set.new
    @result = []
  end

  # @return [Array<String>]
  def create()
    @result << Emitter.comment('')
    @result << Emitter.comment('New house')
    walls_color = POSSIBLE_COLORS.sample

    door_part = Door.new
    #@type [Integer]
    door_x_position = (1..(@x_width - 1 - (door_part.x))).to_a.sample

    available_columns = (0..@x_width - 1).to_a

    door_x_position.upto(door_x_position + door_part.x - 1) do |x|
      available_columns.delete(x)
      0.upto(door_part.y - 1) do |y|
        not_occupied?(
          x: x,
          y: -y,
          z: 0,
        )
      end
    end

    door_color = (POSSIBLE_COLORS - [walls_color]).sample
    add_part(
      part: door_part,
      color: door_color,
      x: door_x_position,
      y: 0,
      z: 0,
    )

    window_part = Windows.new
    window_color = (POSSIBLE_COLORS - [walls_color, door_color]).sample
    create_windows(
      door_part: door_part,
      window_color: window_color,
      window_part: window_part,
      available_columns: available_columns
    )

    create_walls(walls_color)

    create_roof(walls_color)

    @result
  end

  private

  # @param [Integer] y
  # @param [Integer] z
  # @param [Integer] from_x
  # @param [Integer] to_x
  # @param [Color] walls_color
  # @return [void]
  def create_wall_along_x(y:, z:, from_x:, to_x:, walls_color:)
    length = to_x - from_x + 1
    part_classes = Part.calculate_fit(length, Brick::BY_SIZE_X)
    if y % 2 == 1
      part_classes = part_classes.reverse
    end
    current_x = from_x
    part_classes.each do |part_classes|
      part = part_classes.new
      add_part(
        x: current_x,
        y: y,
        z: z,
        part: part,
        color: walls_color
      )
      current_x += part.x
    end
  end

  def create_walls(walls_color)
    0.downto(-@height) do |row|
      @result << Emitter.comment("Row #{row}")
      if row % 2 == 0
        # Front wall
        0.upto(@x_width - 1) do |column|
          add_1_x_1_brick_if_not_occupied(
            color: walls_color,
            x: column,
            y: row,
            z: 0,
          )
        end

        # Back wall
        create_wall_along_x(
          y: row,
          from_x: 0,
          to_x: @x_width - 1,
          z: (@z_width - 1),
          walls_color: walls_color,
        )

        # Left wall
        add_part(
          x: 0,
          y: row,
          z: 1,
          part: Brick1X8Z.new,
          color: walls_color,
        )

        # Right wall
        add_part(
          x: (@x_width - 1),
          y: row,
          z: 1,
          part: Brick1X8Z.new,
          color: walls_color,
        )
      else
        # Front wall
        1.upto(@x_width - 2) do |column|
          add_1_x_1_brick_if_not_occupied(
            color: walls_color,
            x: column,
            y: row,
            z: 0,
          )
        end

        # Back wall
        create_wall_along_x(
          y: row,
          from_x: 1,
          to_x: @x_width - 2,
          z: (@z_width - 1),
          walls_color: walls_color,
        )

        # Left wall
        add_part(
          x: 0,
          y: row,
          z: 0,
          part: Brick1X10Z.new,
          color: walls_color,
        )

        # Right wall
        add_part(
          x: (@x_width - 1),
          y: row,
          z: 0,
          part: Brick1X10Z.new,
          color: walls_color,
        )
      end
    end
  end

  def create_roof(walls_color)
    roof_parts_classes = Part.calculate_fit(@x_width, Plate::BY_SIZE)
    current_x = 0
    roof_parts_classes.each do |roof_part_class|
      roof_part = roof_part_class.new
      add_part(
        x: current_x,
        y: -@height - 1,
        z: 0,
        part: roof_part,
        color: walls_color
      )
      current_x += roof_part.x
    end
  end

  # @param [Part] door_part
  # @param [Color] window_color
  # @param [Part] window_part
  # @param [Array<Integer>] available_columns
  # @return [void]
  def create_windows(door_part:, window_color:, window_part:, available_columns:)
    while true
      found = false
      available_columns.shuffle.each do |column|
        unless found
          if ((column - 1..(column + window_part.x)).to_a - available_columns) == []
            # Enough space to create the window
            create_window(
              door_part: door_part,
              window_color: window_color,
              window_part: window_part,
              window_x_position: column
            )
            available_columns -= (column..(column + window_part.x - 1)).to_a
            found = true
          end
        end
      end
      unless found
        return
      end
    end
  end

  # @param [Part] door_part
  # @param [Color] window_color
  # @param [Part] window_part
  # @param [Integer] window_x_position
  # @return [void]
  def create_window(door_part:, window_color:, window_part:, window_x_position:)
    window_x_position.upto(window_x_position + window_part.x - 1) do |x|
      (-door_part.y + window_part.y).downto(-door_part.y + 1) do |y|
        not_occupied?(
          x: x,
          y: y,
          z: 0,
        )
      end
    end

    add_part(
      color: window_color,
      part: window_part,
      x: window_x_position,
      y: -door_part.y + window_part.y,
      z: 0,
    )
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [Set, nil]
  def not_occupied?(x:, y:, z:)
    key = "#{x}-#{y}-#{z}"
    @occupied_bricks.add?(key)
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @param [Color] color
  # @return [void]
  def add_1_x_1_brick_if_not_occupied(x:, y:, z:, color:)
    if not_occupied?(x: x, y: y, z: z)
      add_part(
        x: x,
        y: y,
        z: z,
        part: Brick1X1.new,
        color: color,
      )
    end
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @param [Color] color
  # @param [Part] part
  # @return [void]
  def add_part(x:, y:, z:, part:, color:)
    @result.concat(
      part.create(
        color: color,
        x: @x_origin + x,
        y: y,
        z: @z_origin + z,
      )
    )
  end
end

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
