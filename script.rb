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

  attr_reader :name, :code, :x, :y, :z

  # @param [String] name
  # @param [String] code
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  def initialize(x:, y:, z:)
    @x = x
    @y = y
    @z = z
  end

  # @param [Color] color
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [Array<String>]
  def create(color:, x:, y:, z:)
    raise NotImplementedError
  end
end

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
  # @param [String] part_name
  # @param [String] part_code
  # @param [Color] color
  # @param [Orientation] orientation
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def self.emit(part_name:, part_code:, color:, orientation:, x:, y:, z:)
    comment("#{part_name}, color: #{color.name}, position: (#{x}, #{y}, #{z}), orientation: #{orientation.name}") +
      "1 #{color.code} #{x} #{y} #{z} #{orientation.code} #{part_code}.dat\n"
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
            available_columns -= (column .. (column + window_part.x - 1)).to_a
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

File.open('result.ldr', 'w') do |result|
  result << "0\n"
  current_x = 0
  #20.upto(20) do |x_width|
    6.upto(30) do |x_width|
    House.new(x_origin: current_x, z_origin: 0, x_width: x_width, z_width: 10, height: 6).create().each do |line|
      result << line
    end
    result << "\n"
    current_x += x_width + 1
  end
end
