#!/usr/bin/env ruby

require 'set'

class Color
  attr_reader :name, :code

  # @param [String] name
  # @param [Integer] code
  def initialize(name:, code:)
    @name = name
    @code = code
  end

  BLUE = Color.new(name: 'blue', code: 1)
  RED = Color.new(name: 'red', code: 4)
  YELLOW = Color.new(name: 'yellow', code: 14)
  WHITE = Color.new(name: 'white', code: 15)

end

class Part
  BRICK_WIDTH = 20
  BRICK_HEIGHT = 24
  PLATE_HEIGHT = 8
  STUD_HEIGHT = 4

  attr_reader :name, :code, :y, :x, :z

  # @param [String] name
  # @param [String] code
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] stacking_y
  # @param [Integer] z
  # @param [Orientation] orientation
  def initialize(name:, code:, x:, y:, stacking_y:, z:, orientation:)
    @name = name
    @code = code
    @x = x
    @y = y
    @stacking_y = stacking_y
    @z = z
    @orientation = orientation
  end

  def x_in_bricks
    @x / BRICK_WIDTH
  end

  def y_in_bricks
    (@y - STUD_HEIGHT) / BRICK_HEIGHT
  end

  def z_in_bricks
    @z / BRICK_WIDTH
  end

  BRICK_1_X_1 = Part.new(
    name: 'Brick 1 x 1',
    code: '3005',
    x: BRICK_WIDTH,
    y: BRICK_HEIGHT + STUD_HEIGHT,
    stacking_y: BRICK_HEIGHT,
    z: BRICK_WIDTH,
    orientation: Orientation::DEFAULT,
    )

  PLATE_1_X_10 = Part.new(
    name: 'Plate 1 x 10',
    code: '4477',
    x: BRICK_WIDTH * 10,
    y: PLATE_HEIGHT + STUD_HEIGHT,
    stacking_y: PLATE_HEIGHT,
    z: BRICK_WIDTH,
    orientation: Orientation::DEFAULT,
    )

  DOOR_1_X_4_X_5_WITH_4_PANES = Part.new(
    name: 'Door 1 x 4 x 5 with 4 Panes',
    code: '3861',
    x: BRICK_WIDTH,
    y: (BRICK_HEIGHT * 5) + STUD_HEIGHT,
    stacking_y: BRICK_HEIGHT * 5,
    z: BRICK_WIDTH * 4,
    orientation: Orientation::DEFAULT,
    )

  WINDOW_1_X_4_X_3 = Part.new(
    name: 'Window 1 x 4 x 3',
    code: '3853',
    x: BRICK_WIDTH * 4,
    y: (BRICK_HEIGHT * 3) + STUD_HEIGHT,
    stacking_y: BRICK_HEIGHT * 3,
    z: BRICK_WIDTH,
    orientation: Orientation::DEFAULT,
    )

  WINDOW_1_X_2_X_3_PANE_WITH_THICK_CORNER_TABS = Part.new(
    name: 'Window 1 x 2 x 3 Pane with Thick Corner Tabs',
    code: '60608',
    x: BRICK_WIDTH,
    y: (BRICK_HEIGHT * 2.5),
    stacking_y: (BRICK_HEIGHT * 2.5),
    z: BRICK_WIDTH * 2,
    orientation: Orientation::DEFAULT,
    )

end

class Orientation
  attr_reader :name, :code

  # @param [String] name
  # @param [String] code
  def initialize(name:, code:)
    @name = name
    @code = code
  end

  DEFAULT = Orientation.new(name: 'Default', code: ' 1 0 0 0 1 0 0 0 1')
  Z_90 = Orientation.new(name: 'Z 90°', code: '0 0 -1 0 1 0 1 0 0')
  Z_270 = Orientation.new(name: 'Z 270°', code: '0 0 1 0 1 0 -1 0 0')
end

class Emitter
  # @param [Color] color
  # @param [Part] part
  # @param [Orientation] orientation
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def self.emit(color:, part:, orientation:, x:, y:, z:)
    comment("#{part.name}, color: #{color.name}, position: (#{x}, #{y}, #{z}), orientation: #{orientation.name}") +
      "1 #{color.code} #{x} #{y} #{z} #{orientation.code} #{part.code}.dat\n"
  end

  # @return [String]
  # @param [String] content
  def self.comment(content)
    "0 \\\\ #{content}\n"
  end
end

class House
  POSSIBLE_COLORS = [
    Color::BLUE,
    Color::RED,
    Color::YELLOW,
    Color::WHITE,
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
    walls_color = POSSIBLE_COLORS.sample

    door_part = Part::DOOR_1_X_4_X_5_WITH_4_PANES
    door_x_position = (1..(@x_width - 1 - (door_part.z_in_bricks))).to_a.sample
    door_x_position.upto(door_x_position + door_part.z_in_bricks - 1) do |x|
      0.upto(door_part.y_in_bricks - 1) do |y|
        not_occupied?(
          x: x * Part::BRICK_WIDTH,
          y: -((Part::BRICK_HEIGHT + Part::STUD_HEIGHT) + (y * Part::BRICK_HEIGHT)),
          z: 0,
          )
      end
    end
    door_color = (POSSIBLE_COLORS - [walls_color]).sample
    add_part(
      color: door_color,
      part: door_part,
      orientation: Orientation::Z_90,
      x: (door_x_position + door_part.z_in_bricks - 1) * Part::BRICK_WIDTH,
      y: -door_part.y,
      z: 0,
      )

    window_part = Part::WINDOW_1_X_4_X_3
    window_color = (POSSIBLE_COLORS - [walls_color, door_color]).sample

    # Window before the door
    if door_x_position > (window_part.x_in_bricks + 1)
      window_x_position = (1..(door_x_position - window_part.x_in_bricks - 1)).to_a.sample
      create_window(door_part: door_part, window_color: window_color, window_part: window_part, window_x_position: window_x_position)
    end
    # Window after the door
    if (door_x_position + door_part.z_in_bricks + window_part.x_in_bricks + 1) < @x_width
      window_x_position = ((door_x_position + door_part.z_in_bricks + 1)..(@x_width - window_part.x_in_bricks - 1)).to_a.sample
      create_window(door_part: door_part, window_color: window_color, window_part: window_part, window_x_position: window_x_position)
    end

    y = -(Part::BRICK_HEIGHT + Part::STUD_HEIGHT)
    0.upto(@height) do |row|
      @result << Emitter.comment("Row #{row}")

      x = 0
      @x_width.times do
        add_1_x_1_brick_if_not_occupied(
          color: walls_color,
          x: x,
          y: y,
          z: 0,
          )
        x += Part::BRICK_WIDTH
      end

      x = 0
      @x_width.times do
        add_1_x_1_brick_if_not_occupied(
          color: walls_color,
          x: x,
          y: y,
          z: ((@z_width - 1) * Part::BRICK_WIDTH),
          )
        x += Part::BRICK_WIDTH
      end

      z = Part::BRICK_WIDTH
      (@z_width - 2).times do
        add_1_x_1_brick_if_not_occupied(
          color: walls_color,
          x: 0,
          y: y,
          z: z,
          )
        z += Part::BRICK_WIDTH
      end
      z = Part::BRICK_WIDTH
      (@z_width - 2).times do
        add_1_x_1_brick_if_not_occupied(
          color: walls_color,
          x: ((@x_width - 1) * Part::BRICK_WIDTH),
          y: y,
          z: z,
          )
        z += Part::BRICK_WIDTH
      end
      y -= Part::BRICK_HEIGHT
    end

    x = 0
    @x_width.times do
      add_part(
        x: x,
        y: -((Part::BRICK_HEIGHT * (@height + 1)) + Part::STUD_HEIGHT + Part::PLATE_HEIGHT),
        z: ((@z_width / 2) - 0.5) * Part::BRICK_WIDTH,
        part: Part::PLATE_1_X_10,
        color: walls_color,
        orientation: Orientation::Z_90
      )
      x += Part::BRICK_WIDTH
    end

    @result
  end

  private

  # @param [Part] door_part
  # @param [Color] window_color
  # @param [Part] window_part
  # @param [Integer] window_x_position
  # @return [void]
  def create_window(door_part:, window_color:, window_part:, window_x_position:)
    window_pane_part = Part::WINDOW_1_X_2_X_3_PANE_WITH_THICK_CORNER_TABS
    window_x_position.upto(window_x_position + window_part.x_in_bricks - 1) do |x|
      (door_part.y_in_bricks - window_part.y_in_bricks).upto(door_part.y_in_bricks - 1) do |y|
        not_occupied?(
          x: x * Part::BRICK_WIDTH,
          y: -((Part::BRICK_HEIGHT + Part::STUD_HEIGHT) + (y * Part::BRICK_HEIGHT)),
          z: 0,
          )
      end
    end

    add_part(
      color: window_color,
      part: window_part,
      orientation: Orientation::DEFAULT,
      x: ((window_x_position + window_part.x_in_bricks / 2) - 0.5) * Part::BRICK_WIDTH,
      y: -door_part.y,
      z: 0,
      )
    add_part(
      color: window_color,
      part: window_pane_part,
      orientation: Orientation::Z_90,
      x: (window_x_position) * Part::BRICK_WIDTH - 2,
      y: -door_part.y + 4,
      z: -8,
      )
    add_part(
      color: window_color,
      part: window_pane_part,
      orientation: Orientation::Z_270,
      x: (window_x_position + 3) * Part::BRICK_WIDTH + 2,
      y: -door_part.y + 4,
      z: -8,
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
        part: Part::BRICK_1_X_1,
        color: color,
        orientation: Orientation::DEFAULT
      )
    end
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @param [Color] color
  # @param [Part] part
  # @param [Orientation] orientation
  # @return [void]
  def add_part(x:, y:, z:, part:, color:, orientation:)
    @result << Emitter.emit(
      color: color,
      part: part,
      orientation: orientation,
      x: x + @x_origin,
      y: y,
      z: z + @z_origin,
      )
  end
end

File.open('result.ldr', 'w') do |result|
  result << "0\n"
  current_x = 0
  #11.upto(11) do |x_width|
  6.upto(30) do |x_width|
    House.new(x_origin: current_x, z_origin: 0, x_width: x_width, z_width: 10, height: 6).create().each do |line|
      result << line
    end
    result << "\n"
    current_x += (x_width + 2) * Part::BRICK_WIDTH
  end
end
