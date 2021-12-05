#!/usr/bin/env ruby

# 30055 Fence Spindled 1 x 4 x 2
require 'set'
require_relative 'color'
require_relative 'orientation'
require_relative 'emitter'
require_relative 'part'

class BRICK_1_X_1 < Part
  def initialize()
    super(
      x: 1,
      y: 1,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Brick 1 x 1',
        part_code: '3005',
        color: color,
        orientation: Orientation::DEFAULT,
        x: (x - 1) * BRICK_WIDTH,
        y: ((y - 1) * BRICK_HEIGHT) - STUD_HEIGHT,
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class DOOR_1_X_4_X_5_WITH_4_PANES < Part
  def initialize()
    super(
      x: 4,
      y: 5,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Door 1 x 4 x 5 with 4 Panes',
        part_code: '3861',
        color: color,
        orientation: Orientation::Z_90,
        x: (x + @x - 2) * BRICK_WIDTH,
        y: ((y - @y) * BRICK_HEIGHT) - STUD_HEIGHT,
        z: z,
      ),
    ]
  end
end

class PLATE_1_X_10 < Part
  def initialize()
    super(
      x: 1,
      y: 1,
      z: 10,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Plate 1 x 10',
        part_code: '4477',
        color: color,
        orientation: Orientation::Z_90,
        x: (x - 1) * BRICK_WIDTH,
        y: (y * BRICK_HEIGHT) - (STUD_HEIGHT * 2),
        z: (z + @z / 2 - 0.5) * BRICK_WIDTH,
      ),
    ]
  end
end

class WINDOW_1_X_4_X_3 < Part
  def initialize()
    super(
      x: 4,
      y: 3,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    pane_z = (z * BRICK_WIDTH) - 8
    pane_y = (y - @y) * BRICK_HEIGHT - STUD_HEIGHT + 4
    [
      Emitter.emit(
        part_name: 'Window 1 x 4 x 3',
        part_code: '3853',
        color: color,
        orientation: Orientation::DEFAULT,
        x: (x + 0.5) * BRICK_WIDTH,
        y: (y - @y) * BRICK_HEIGHT - STUD_HEIGHT,
        z: z * BRICK_WIDTH,
      ),
      Emitter.emit(
        part_name: 'Window 1 x 2 x 3 Pane with Thick Corner Tabs',
        part_code: '60608',
        color: color,
        orientation: Orientation::Z_90,
        x: (x - 1) * BRICK_WIDTH - 2,
        y: pane_y,
        z: pane_z,
      ),
      Emitter.emit(
        part_name: 'Window 1 x 2 x 3 Pane with Thick Corner Tabs',
        part_code: '60608',
        color: color,
        orientation: Orientation::Z_270,
        x: (x + 2) * BRICK_WIDTH + 2,
        y: pane_y,
        z: pane_z,
      ),
    ]
  end
end

class BASEPLATE_32_X_32_WITH_6_STUD_CROSSROADS_WITH_WHITE_DASHED_LINES_AND_CROSSWALKS < Part
  def initialize()
    super(
      x: 32,
      y: 1,
      z: 32,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Baseplate 32 x 32 with 6-Stud Crossroads with White Dashed Lines and Crosswalks Print',
        part_code: '44343p03',
        color: Color::DARK_BLUISH_GRAY,
        orientation: Orientation::DEFAULT,
        x: (x + 14.5) * BRICK_WIDTH,
        y: y,
        z: (z + 14.5) * BRICK_WIDTH,
      ),
    ]
  end
end

class BASEPLATE_32_X_32_WITH_6_STUD_STRAIGHT_AND_ROAD_WITH_WHITE_DASHED_LINES_AND_STORM_DRAIN < Part
  def initialize()
    super(
      x: 32,
      y: 1,
      z: 32,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Baseplate 32 x 32 with 6-Stud Straight and Road with White Dashed Lines and Storm Drain Print',
        part_code: '44336p04',
        color: Color::DARK_BLUISH_GRAY,
        orientation: Orientation::Z_90,
        x: (x + 15.5) * BRICK_WIDTH,
        y: y,
        z: (z + 14.5) * BRICK_WIDTH,
      ),
    ]
  end
end

class House
  POSSIBLE_COLORS = [
    Color::BLUE,
    Color::RED,
    Color::YELLOW,
    Color::WHITE,
    Color::LIGHT_GRAY,
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

    door_part = DOOR_1_X_4_X_5_WITH_4_PANES.new
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

    window_part = WINDOW_1_X_4_X_3.new
    window_color = (POSSIBLE_COLORS - [walls_color, door_color]).sample
    create_windows(
      door_part: door_part,
      window_color: window_color,
      window_part: window_part,
      available_columns: available_columns
    )

    0.downto(-@height) do |row|
      @result << Emitter.comment("Row #{row}")
      0.upto(@x_width - 1) do |column|
        add_1_x_1_brick_if_not_occupied(
          color: walls_color,
          x: column,
          y: row,
          z: 0,
        )
      end

      0.upto(@x_width - 1) do |column|
        add_1_x_1_brick_if_not_occupied(
          color: walls_color,
          x: column,
          y: row,
          z: (@z_width - 1),
        )
      end

      1.upto(@z_width - 2) do |z|
        add_1_x_1_brick_if_not_occupied(
          color: walls_color,
          x: 0,
          y: row,
          z: z,
        )
      end
      1.upto(@z_width - 2) do |z|
        add_1_x_1_brick_if_not_occupied(
          color: walls_color,
          x: (@x_width - 1),
          y: row,
          z: z,
        )
      end
    end

    0.upto(@x_width - 1) do |column|
      add_part(
        x: column,
        y: -@height - 1,
        z: 0,
        part: PLATE_1_X_10.new,
        color: walls_color
      )
    end

    @result
  end

  private

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
        part: BRICK_1_X_1.new,
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

File.open('result.ldr', 'w') do |result|
  result << "0\n"
  current_x = 0
  roads_in_house_blocks = 5
  blocks_in_house_blocks = (3 * 2) + (32 * roads_in_house_blocks)
  BASEPLATE_32_X_32_WITH_6_STUD_CROSSROADS_WITH_WHITE_DASHED_LINES_AND_CROSSWALKS
    .new
    .create(color: Color::DARK_BLUISH_GRAY, x: -(32 - 3), y: 0, z: -(32 - 3))
    .each do |l|
    result << l
  end
  1.upto(roads_in_house_blocks) do |index|
    BASEPLATE_32_X_32_WITH_6_STUD_STRAIGHT_AND_ROAD_WITH_WHITE_DASHED_LINES_AND_STORM_DRAIN
      .new
      .create(
        color: Color::DARK_BLUISH_GRAY,
        x: -30 + (index * BASEPLATE_32_X_32_WITH_6_STUD_STRAIGHT_AND_ROAD_WITH_WHITE_DASHED_LINES_AND_STORM_DRAIN.new.x),
        y: 0,
        z: -(32 - 3)
      )
      .each do |l|
      result << l
    end
  end
  BASEPLATE_32_X_32_WITH_6_STUD_CROSSROADS_WITH_WHITE_DASHED_LINES_AND_CROSSWALKS
    .new
    .create(color: Color::DARK_BLUISH_GRAY, x: 32 * roads_in_house_blocks + 3, y: 0, z: -(32 - 3))
    .each do |l|
    result << l
  end

  houses_list = nil
  until houses_list
    houses_list = find_houses_list(
      blocks_in_house_blocks: blocks_in_house_blocks,
      min_house_width: 6,
      max_house_width: 30,
      width_between_houses: 5
    )
  end

  #20.upto(20) do |x_width|
  current_x = 0
  houses_list.shuffle.each do |house_width|
    House.new(x_origin: current_x, z_origin: 0, x_width: house_width, z_width: 10, height: 6).create().each do |line|
      result << line
    end
    result << "\n"
    current_x += house_width + 5
  end
end
