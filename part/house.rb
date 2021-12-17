class House
  include Occupier
  include WithResult

  HOUSE_COLORS = {
    Color::BLACK => [
      Color::LIGHT_GRAY,
      Color::MEDIUM_BLUE,
      Color::DARK_PINK,
      Color::PINK,
      Color::RED,
      Color::WHITE,
      Color::YELLOW,
      Color::ORANGE,
      Color::LIGHT_FLESH,
    ],
    Color::BLUE => [
      Color::WHITE,
      Color::YELLOW,
      Color::ORANGE,
      Color::LIGHT_FLESH,
    ],
    Color::BRIGHT_GREEN => [
      Color::WHITE,
      Color::YELLOW,
      Color::ORANGE,
      Color::LIGHT_FLESH,
      Color::CHROME_GOLD,
    ],
    Color::DARK_BLUISH_GRAY => [
      Color::WHITE,
      Color::YELLOW,
      Color::ORANGE,
      Color::LIGHT_FLESH,
      Color::CHROME_GOLD,
    ],
    Color::DARK_TURQUOISE => [
      Color::WHITE,
      Color::YELLOW,
      Color::ORANGE,
      Color::LIGHT_FLESH,
    ],
    Color::GREEN => [
      Color::WHITE,
      Color::YELLOW,
      Color::ORANGE,
      Color::LIGHT_FLESH,
    ],
    Color::LIGHT_GRAY => [
      Color::BLACK,
      Color::BLUE,
      Color::BRIGHT_GREEN,
      Color::DARK_BLUISH_GRAY,
      Color::DARK_TURQUOISE,
      Color::GREEN,
      Color::MEDIUM_BLUE,
      Color::PINK,
      Color::RED,
      Color::YELLOW,
      Color::DARK_PINK,
      Color::ORANGE,
      Color::LIGHT_FLESH,
    ],
    Color::MEDIUM_BLUE => [
      Color::BLACK,
      Color::BLUE,
      Color::BRIGHT_GREEN,
      Color::DARK_BLUISH_GRAY,
      Color::DARK_TURQUOISE,
      Color::GREEN,
      Color::LIGHT_GRAY,
      Color::PINK,
      Color::RED,
      Color::WHITE,
      Color::YELLOW,
      Color::DARK_PINK,
      Color::ORANGE,
      Color::LIGHT_FLESH,
    ],
    Color::PINK => [
      Color::BLACK,
      Color::BLUE,
      Color::BRIGHT_GREEN,
      Color::DARK_BLUISH_GRAY,
      Color::DARK_TURQUOISE,
      Color::GREEN,
      Color::LIGHT_GRAY,
      Color::MEDIUM_BLUE,
      Color::RED,
      Color::WHITE,
      Color::CHROME_GOLD,
    ],
    Color::RED => [
      Color::WHITE,
      Color::YELLOW,
    ],
    Color::WHITE => [
      Color::BLACK,
      Color::BLUE,
      Color::BRIGHT_GREEN,
      Color::DARK_BLUISH_GRAY,
      Color::DARK_TURQUOISE,
      Color::GREEN,
      Color::LIGHT_GRAY,
      Color::MEDIUM_BLUE,
      Color::PINK,
      Color::RED,
      Color::DARK_PINK,
      Color::ORANGE,
      Color::LIGHT_FLESH,
    ],
    Color::YELLOW => [
      Color::BLACK,
      Color::BLUE,
      Color::BRIGHT_GREEN,
      Color::DARK_BLUISH_GRAY,
      Color::DARK_TURQUOISE,
      Color::GREEN,
      Color::LIGHT_GRAY,
      Color::MEDIUM_BLUE,
      Color::RED,
      Color::WHITE,
      Color::ORANGE,
    ],
    Color::DARK_PINK => [
      Color::BLACK,
      Color::BLUE,
      Color::BRIGHT_GREEN,
      Color::DARK_BLUISH_GRAY,
      Color::DARK_TURQUOISE,
      Color::GREEN,
      Color::LIGHT_GRAY,
      Color::MEDIUM_BLUE,
      Color::RED,
      Color::WHITE,
      Color::YELLOW,
      Color::ORANGE,
    ],
    Color::ORANGE => [
      Color::BLACK,
      Color::BLUE,
      Color::BRIGHT_GREEN,
      Color::DARK_BLUISH_GRAY,
      Color::DARK_TURQUOISE,
      Color::GREEN,
      Color::LIGHT_GRAY,
      Color::MEDIUM_BLUE,
      Color::RED,
      Color::WHITE,
      Color::YELLOW,
      Color::LIGHT_FLESH,
      Color::CHROME_GOLD,
    ],
    Color::LIGHT_FLESH => [
      Color::BLACK,
      Color::BLUE,
      Color::BRIGHT_GREEN,
      Color::DARK_BLUISH_GRAY,
      Color::DARK_PINK,
      Color::DARK_TURQUOISE,
      Color::GREEN,
      Color::LIGHT_GRAY,
      Color::MEDIUM_BLUE,
      Color::ORANGE,
      Color::PINK,
      Color::RED,
      Color::WHITE,
      Color::YELLOW,
      Color::CHROME_GOLD,
    ],
    Color::CHROME_GOLD => [
      Color::BLACK,
      Color::BLUE,
      Color::BRIGHT_GREEN,
      Color::DARK_BLUISH_GRAY,
      Color::DARK_PINK,
      Color::DARK_TURQUOISE,
      Color::GREEN,
      Color::LIGHT_FLESH,
      Color::LIGHT_GRAY,
      Color::MEDIUM_BLUE,
      Color::ORANGE,
      Color::PINK,
      Color::RED,
      Color::WHITE,
      Color::YELLOW,
    ]
  }.freeze

  # @param [Integer] x_origin
  # @param [Integer] z_origin
  # @param [Integer] x_width
  # @param [Integer] z_width
  # @param [Integer] height
  # @param [Color, nil] walls_color
  # @param [Color, nil] door_and_windows_color
  def initialize(x_origin:, z_origin:, x_width:, z_width:, height:, walls_color: nil, door_and_windows_color: nil)
    @x_origin = x_origin
    @z_origin = z_origin
    @x_width = x_width
    @z_width = z_width
    @height = height
    @walls_color = walls_color || HOUSE_COLORS.keys.sample
    @door_and_windows_color = door_and_windows_color || HOUSE_COLORS[@walls_color].sample
  end

  def create_front_facing()
    create(
      door_part: Door::TYPES.sample[:front].new,
      door_z: 0,
      position: :front,
    )
  end

  def create_back_facing()
    create(
      door_part: Door::TYPES.sample[:back].new,
      door_z: @z_width - 1,
      position: :back,
    )
  end

  private

  # @param [Part] door_part
  # @param [Integer] door_z
  # @param [Symbol] position :front or :back
  # @return [Array<String>]
  def create(door_z:, door_part:, position:)
    add_result(Emitter.comment(''))
    add_result(Emitter.comment('New house'))

    door_x_position = (1..(@x_width - 1 - (door_part.x))).to_a.sample

    available_position_door_wall = (0..(@x_width - 1)).to_a
    available_position_other_wall = (0..@x_width - 1).to_a

    door_x_position.upto(door_x_position + door_part.x - 1) do |x|
      available_position_door_wall.delete(x)
      0.upto(door_part.y - 1) do |y|
        occupy(
          x: x,
          y: -y,
          z: door_z,
        )
      end
    end

    add_part(
      part: door_part,
      color: @door_and_windows_color,
      x: door_x_position,
      y: 0,
      z: door_z,
    )

    windows_type = Windows::TYPES.sample

    # Front windows
    windows_front_part = windows_type[:front].new
    find_windows_positions(
      windows_width: windows_front_part.x,
      available_positions: (position == :front) ? available_position_door_wall : available_position_other_wall
    ) do |column|
      create_windows_along_x(
        y_top: -door_part.y,
        window_part: windows_front_part,
        window_x_position: column,
        z: 0,
      )
    end

    # Back windows
    windows_back_part = windows_type[:back].new
    find_windows_positions(
      windows_width: windows_front_part.x,
      available_positions: (position == :front) ? available_position_other_wall : available_position_door_wall
    ) do |column|
      create_windows_along_x(
        y_top: -door_part.y,
        window_part: windows_back_part,
        window_x_position: column,
        z: (@z_width - 1),
      )
    end

    # Left windows
    windows_left_part = windows_type[:left].new
    find_windows_positions(
      windows_width: windows_front_part.x,
      available_positions: (0..@z_width - 1).to_a
    ) do |column|
      create_windows_along_z(
        y_top: -door_part.y,
        window_part: windows_left_part,
        window_z_position: column,
        x: 0,
      )
    end

    # Right windows
    windows_right_part = windows_type[:right].new
    find_windows_positions(
      windows_width: windows_front_part.x,
      available_positions: (0..@z_width - 1).to_a
    ) do |column|
      create_windows_along_z(
        y_top: -door_part.y,
        window_part: windows_right_part,
        window_z_position: column,
        x: @x_width - 1,
      )
    end

    create_walls()
    create_roof()
    result
  end

  # @param [Integer] y
  # @param [Integer] z
  # @param [Integer] from_x
  # @param [Integer] to_x
  # @return [void]
  def create_wall_along_x(y:, z:, from_x:, to_x:)
    current_from_x = from_x
    while occupied?(x: current_from_x, y: y, z: z)
      current_from_x += 1
    end
    if current_from_x >= to_x
      return
    end
    current_to_x = current_from_x
    while (current_to_x < to_x) && (!occupied?(x: current_to_x, y: y, z: z))
      current_to_x += 1
    end
    create_wall_segment_along_x(y: y, z: z, from_x: current_from_x, to_x: current_to_x)
    if current_to_x < to_x
      create_wall_along_x(y: y, z: z, from_x: current_to_x + 1, to_x: to_x)
    end
  end

  # @param [Integer] y
  # @param [Integer] z
  # @param [Integer] from_x
  # @param [Integer] to_x
  # @return [void]
  def create_wall_segment_along_x(y:, z:, from_x:, to_x:)
    length = to_x - from_x
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
        color: @walls_color
      )
      current_x += part.x
    end
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] from_z
  # @param [Integer] to_z
  # @return [void]
  def create_wall_along_z(y:, x:, from_z:, to_z:)
    current_from_z = from_z
    while occupied?(z: current_from_z, y: y, x: x)
      current_from_z += 1
    end
    if current_from_z >= to_z
      return
    end
    current_to_z = current_from_z
    while (current_to_z < to_z) && (!occupied?(z: current_to_z, y: y, x: x))
      current_to_z += 1
    end
    create_wall_segment_along_z(y: y, x: x, from_z: current_from_z, to_z: current_to_z)
    if current_to_z < to_z
      create_wall_along_z(y: y, x: x, from_z: current_to_z + 1, to_z: to_z)
    end
  end

  # @param [Integer] y
  # @param [Integer] x
  # @param [Integer] from_z
  # @param [Integer] to_z
  # @return [void]
  def create_wall_segment_along_z(y:, x:, from_z:, to_z:)
    length = to_z - from_z
    part_classes = Part.calculate_fit(length, Brick::BY_SIZE_Z)
    if y % 2 == 1
      part_classes = part_classes.reverse
    end
    current_z = from_z
    part_classes.each do |part_classes|
      part = part_classes.new
      add_part(
        x: x,
        y: y,
        z: current_z,
        part: part,
        color: @walls_color
      )
      current_z += part.z
    end
  end

  def create_walls()
    0.downto(-@height) do |row|
      add_result(Emitter.comment("Row #{row}"))
      if row % 2 == 0
        # Front wall
        create_wall_along_x(
          y: row,
          from_x: 0,
          to_x: @x_width,
          z: 0,
        )

        # Back wall
        create_wall_along_x(
          y: row,
          from_x: 0,
          to_x: @x_width,
          z: (@z_width - 1),
        )

        # Left wall
        create_wall_along_z(
          y: row,
          from_z: 1,
          to_z: @z_width - 1,
          x: 0,
        )

        # Right wall
        create_wall_along_z(
          y: row,
          from_z: 1,
          to_z: @z_width - 1,
          x: (@x_width - 1),
        )
      else
        # Front wall
        create_wall_along_x(
          y: row,
          from_x: 1,
          to_x: @x_width - 1,
          z: 0,
        )

        # Back wall
        create_wall_along_x(
          y: row,
          from_x: 1,
          to_x: @x_width - 1,
          z: (@z_width - 1),
        )

        # Left wall
        create_wall_along_z(
          y: row,
          from_z: 0,
          to_z: @z_width,
          x: 0,
        )

        # Right wall
        create_wall_along_z(
          y: row,
          from_z: 0,
          to_z: @z_width,
          x: (@x_width - 1),
        )
      end
    end
  end

  def create_roof()
    roof_parts_classes = Part.calculate_fit(@x_width, Plate::BY_SIZE)
    current_x = 0
    roof_parts_classes.each do |roof_part_class|
      roof_part = roof_part_class.new
      add_part(
        x: current_x,
        y: -@height - 1,
        z: 0,
        part: roof_part,
        color: @walls_color
      )
      current_x += roof_part.x
    end
  end

  # @param [Integer] windows_width
  # @param [Array<Integer>] available_positions
  # @return [void]
  def find_windows_positions(windows_width:, available_positions:)
    while true
      found = false
      available_positions.shuffle.each do |position|
        unless found
          if ((position - 1..(position + windows_width)).to_a - available_positions) == []
            # Enough space to create the window
            yield(position)
            available_positions -= (position..(position + windows_width - 1)).to_a
            found = true
          end
        end
      end
      unless found
        return
      end
    end
  end

  # @param [Integer] y_top
  # @param [Part] window_part
  # @param [Integer] window_x_position
  # @param [Integer] z
  # @return [void]
  def create_windows_along_x(y_top:, window_part:, window_x_position:, z:)
    window_x_position.upto(window_x_position + window_part.x - 1) do |x|
      (y_top + window_part.y).downto(y_top + 1) do |y|
        occupy(
          x: x,
          y: y,
          z: z,
        )
      end
    end

    add_part(
      color: @door_and_windows_color,
      part: window_part,
      x: window_x_position,
      y: y_top + window_part.y,
      z: z,
    )
  end

  # @param [Integer] y_top
  # @param [Part] window_part
  # @param [Integer] window_z_position
  # @param [Integer] x
  # @return [void]
  def create_windows_along_z(y_top:, window_part:, window_z_position:, x:)
    window_z_position.upto(window_z_position + window_part.z - 1) do |z|
      (y_top + window_part.y).downto(y_top + 1) do |y|
        occupy(
          x: x,
          y: y,
          z: z,
        )
      end
    end

    add_part(
      color: @door_and_windows_color,
      part: window_part,
      x: x,
      y: y_top + window_part.y,
      z: window_z_position,
    )
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @param [Color] color
  # @param [Part] part
  # @return [void]
  def add_part(x:, y:, z:, part:, color:)
    concat_result(
      part.create(
        color: color,
        x: @x_origin + x,
        y: y,
        z: @z_origin + z,
      )
    )
  end
end