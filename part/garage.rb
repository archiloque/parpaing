class Garage
  include Occupier
  include Measures
  include WithWalls
  include WithResult

  NO_GARAGE = 0
  GARAGE_ON_LEFT = 1
  GARAGE_ON_RIGHT = 2

  GARAGE_WIDTH = 6

  DOOR_RIGHT = Part.new('Door 1 x 3 x 4 Right - Open Between Top and Bottom Hinge', '58380')
  DOOR_LEFT = Part.new('Door 1 x 3 x 4 Left - Open Between Top and Bottom Hinge', '58381')
  DOOR_HEIGHT = 4

  # @param [Integer] x_origin
  # @param [Integer] z_origin
  # @param [Integer] z_width
  # @param [HousesBlock::HouseDefinition] house_definition
  def initialize(
    x_origin:,
    z_origin:,
    z_width:,
    house_definition:
  )
    @x_origin = x_origin
    @z_origin = z_origin
    @z_width = z_width
    @house_definition = house_definition
  end

  # @return [Array<String>]
  def create_front_facing()
    concat_result(
      [
        Emitter.emit(
          part: DOOR_LEFT,
          color: @house_definition.door_and_windows_color,
          orientation: PartOrientation::Z_270,
          x: (@x_origin * BRICK_WIDTH) - 20,
          y: -100,
          z: (@z_origin * BRICK_WIDTH),
        ),
        Emitter.emit(
          part: DOOR_RIGHT,
          color: @house_definition.door_and_windows_color,
          orientation: PartOrientation::Z_90,
          x: (@x_origin * BRICK_WIDTH) + 80,
          y: -100,
          z: (@z_origin * BRICK_WIDTH),
        ),
      ]
    )
    concat_result(
      Plate6X10.new.create(
        x: @x_origin,
        y: -DOOR_HEIGHT,
        z: @z_origin,
        color: @house_definition.walls_color,
      )
    )

    windows_part = @house_definition.windows_type[:back].new
    window_x_position = (GARAGE_WIDTH / 2) - (windows_part.x / 2)
    windows_y = -DOOR_HEIGHT + windows_part.y
    windows_z = @z_width - 1
    window_x_position.upto(window_x_position + windows_part.x - 1) do |x|
      (windows_y).downto(-DOOR_HEIGHT) do |y|
        occupy(
          x: x,
          y: y,
          z: windows_z,
        )
      end
    end

    add_part(
      color: @house_definition.door_and_windows_color,
      part: windows_part,
      x: window_x_position,
      y: windows_y,
      z: windows_z,
    )

    0.downto(-DOOR_HEIGHT + 1) do |row|
      if row % 2 == 0
        # Back wall
        create_wall_along_x(
          y: row,
          from_x: 0,
          to_x: GARAGE_WIDTH,
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
          x: GARAGE_WIDTH - 1,
        )
      else
        # Back wall
        create_wall_along_x(
          y: row,
          from_x: 1,
          to_x: GARAGE_WIDTH - 1,
          z: (@z_width - 1),
        )
        # Left wall
        create_wall_along_z(
          y: row,
          from_z: 1,
          to_z: @z_width,
          x: 0,
        )
        # Right wall
        create_wall_along_z(
          y: row,
          from_z: 1,
          to_z: @z_width,
          x: GARAGE_WIDTH - 1,
        )
      end
    end
    result
  end

  # @return [Array<String>]
  def create_back_facing()
    result
  end

  end
