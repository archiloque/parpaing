class House
  include Occupier
  include WithResult
  include WithWalls

  # @param [Integer] x_origin
  # @param [Integer] z_origin
  # @param [Integer] x_width
  # @param [Integer] z_width
  # @param [Integer] height
  # @param [HousesBlock::HouseDefinition] house_definition
  def initialize(
    x_origin:,
    z_origin:,
    x_width:,
    z_width:,
    height:,
    house_definition:
  )
    @x_origin = x_origin
    @z_origin = z_origin
    @x_width = x_width
    @z_width = z_width
    @height = height
    @house_definition = house_definition
  end

  # @return [Array<String>]
  def create_front_facing()
    create(
      door_part: Door::TYPES.sample[:front].new,
      door_z: 0,
      position: :front,
    )
  end

  # @return [Array<String>]
  def create_back_facing()
    create(
      door_part: Door::TYPES.sample[:back].new,
      door_z: @z_width - 1,
      position: :back,
    )
  end

  private

  # @param [SetPart] door_part
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
      color: @house_definition.door_and_windows_color,
      x: door_x_position,
      y: 0,
      z: door_z,
    )

    # Front windows
    windows_front_part = @house_definition.windows_type[:front].new
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
    windows_back_part = @house_definition.windows_type[:back].new
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
    create_walls_windows(door_part, windows_front_part)
    create_walls
    create_roof
    result
  end

  # @param [SetPart] door_part
  # @param [SetPart] windows_front_part
  # @return [void]
  def create_walls_windows(door_part, windows_front_part)
    # Left windows
    unless @garage == Garage::GARAGE_ON_LEFT
      windows_left_part = @house_definition.windows_type[:left].new
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
    end

    # Right windows
    unless @garage == Garage::GARAGE_ON_RIGHT
      windows_right_part = @house_definition.windows_type[:right].new
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
    end
  end

  def create_walls()
    0.downto(-@height) do |row|
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
    roof_parts_classes = SetPart.calculate_fit(@x_width, Plate::BY_SIZE)
    current_x = 0
    roof_parts_classes.each do |roof_part_class|
      roof_part = roof_part_class.new
      add_part(
        x: current_x,
        y: -@height - 1,
        z: 0,
        part: roof_part,
        color: @house_definition.walls_color
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
  # @param [SetPart] window_part
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
      color: @house_definition.door_and_windows_color,
      part: window_part,
      x: window_x_position,
      y: y_top + window_part.y,
      z: z,
    )
  end

  # @param [Integer] y_top
  # @param [SetPart] window_part
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
      color: @house_definition.door_and_windows_color,
      part: window_part,
      x: x,
      y: y_top + window_part.y,
      z: window_z_position,
    )
  end
end
