require_relative 'cell_positions'

class Cell
  include CellPositions

  HOUSE_WIDTH = 12
  WINDOWS_WIDTH = 4
  HOUSE_HEIGHT = 7
  BETWEEN_WINDOWS_LENGTH = (HOUSE_WIDTH - WINDOWS_WIDTH) / 2

  attr_reader :x, :y, :z, :level, :minus_x_wall, :minus_y_wall, :plus_x_wall, :plus_y_wall

  # @param [Integer] x
  # @param [DrawUnit] y
  # @param [Integer] z
  # @param [Level] level
  def initialize(
    x:,
    y:,
    z:,
    level:
  )
    @x = x
    @y = y
    @z = z
    @level = level

    @plus_y_wall = !((minus_x_filled? && (!minus_x_plus_y_filled?)) || plus_y_filled?)
    @minus_y_wall = !((minus_x_filled? && (!minus_x_minus_y_filled?)) || minus_y_filled?)

    @plus_x_wall = !(plus_x_filled? || (minus_y_filled? && (!plus_x_minus_y_filled?)))
    @minus_x_wall = !(minus_x_filled? || (minus_y_filled? && (!minus_x_minus_y_filled?)))
  end

  # @param [USDA] usda
  # @return [void]
  def create(usda)
    house_position = Usda::Coordinates.new(
      x: @x * HOUSE_WIDTH,
      y: -@y * HOUSE_WIDTH,
      z: @z * HOUSE_HEIGHT
    )

    usda.with(
      Usda::Context.new(
        position: house_position,
        material: Material::YELLOW
      )
    ) do
      usda.create_light(position: Usda::Coordinates.new(x: HOUSE_WIDTH / 2, y: HOUSE_WIDTH / 2, z: 6))
      usda.create_rectangular_cuboid(
        dimension: Usda::Dimension.new(x: HOUSE_WIDTH, y: HOUSE_WIDTH, z: 1),
        position: Usda::Coordinates.new(x: 0, y: 0, z: 0)
      )

      if @plus_y_wall
        wall_in_plus_y = wall_in_direction(Delta::DELTA_PLUS_X, Delta::DELTA_PLUS_Y)
        create_plus_y_wall(usda, wall_in_plus_y)
      end
      if @minus_y_wall
        wall_in_minus_y = wall_in_direction(Delta::DELTA_PLUS_X, Delta::DELTA_MINUS_Y)
        create_minus_y_wall(usda, wall_in_minus_y)
      end
      if @plus_x_wall
        wall_in_plus_x = wall_in_direction(Delta::DELTA_PLUS_Y, Delta::DELTA_PLUS_X)
        create_plus_x_wall(usda, wall_in_plus_x)
      end
      if @minus_x_wall
        wall_in_minus_x = wall_in_direction(Delta::DELTA_PLUS_Y, Delta::DELTA_MINUS_X)
        create_minus_x_wall(usda, wall_in_minus_x)
      end
      unless plus_z_filled?
        create_roof(usda)
      end
    end
  end

  def to_s
    "#{self.class} (#{x}, #{y}, #{z})"
  end

  private

  def create_roof(usda)
    0.upto((HOUSE_WIDTH / 2) - 1).each do |roof_level|
      width = HOUSE_WIDTH - (roof_level * 2)
      usda.create_rectangular_cuboid(
        material: Material::RED,
        dimension: Usda::Dimension.new(x: width, y: width, z: 1),
        position: Usda::Coordinates.new(x: roof_level, y: roof_level, z: 7 + roof_level)
      )
    end
  end

  # @param [USDA] usda
  # @param [WallInDirectionResult] wall_in
  def create_minus_y_wall(usda, wall_in)
    create_y_wall(usda, wall_in)
  end

  # @param [USDA] usda
  # @param [WallInDirectionResult] wall_in
  def create_plus_y_wall(usda, wall_in)
    usda.with(
      Usda::Context.new(
        position: Usda::Coordinates.new(
          x: 0,
          y: HOUSE_WIDTH - 1,
          z: 0,
        ),
      )) do
      create_y_wall(usda, wall_in)
    end
  end

  # @param [USDA] usda
  # @param [WallInDirectionResult] wall_in
  def create_minus_x_wall(usda, wall_in)
    create_x_wall(usda, wall_in)
  end

  # @param [USDA] usda
  # @param [WallInDirectionResult] wall_in
  def create_plus_x_wall(usda, wall_in)
    usda.with(
      Usda::Context.new(
        position: Usda::Coordinates.new(
          x: HOUSE_WIDTH - 1,
          y: 0,
          z: 0,
        ),
      )) do
      create_x_wall(usda, wall_in)
    end
  end

  # @param [USDA] usda
  # @param [WallInDirectionResult] wall_in
  def create_x_wall(usda, wall_in)
    total_y =
      (HOUSE_WIDTH * (wall_in.length + 1)) - 2 +
        (wall_in.corner_begin ? 2 : 0) +
        (wall_in.corner_end ? 2 : 0)
    initial_y = wall_in.corner_begin ? -1 : 1
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: 1, y: total_y, z: 3),
      position: Usda::Coordinates.new(x: 0, y: initial_y, z: 1)
    )
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: 1, y: total_y, z: 1),
      position: Usda::Coordinates.new(x: 0, y: initial_y, z: 6)
    )

    dimension_y = BETWEEN_WINDOWS_LENGTH - (wall_in.corner_begin ? 0 : 2)
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: 1, y: dimension_y, z: 2),
      position: Usda::Coordinates.new(x: 0, y: initial_y, z: 4)
    )

    dimension_y = BETWEEN_WINDOWS_LENGTH - (wall_in.corner_end ? 0 : 2)
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: 1, y: dimension_y, z: 2),
      position: Usda::Coordinates.new(x: 0, y: total_y - dimension_y - 1 + (wall_in.corner_begin ? 0 : 2), z: 4)
    )

    0.upto(wall_in.length - 1) do |between_block|
      usda.create_rectangular_cuboid(
        dimension: Usda::Dimension.new(x: 1, y: BETWEEN_WINDOWS_LENGTH * 2 - 2, z: 2),
        position: Usda::Coordinates.new(x: 0, y: (HOUSE_WIDTH - BETWEEN_WINDOWS_LENGTH) + (HOUSE_WIDTH * between_block) + 1 , z: 4)
      )
    end
  end

  # @param [USDA] usda
  # @param [WallInDirectionResult] wall_in
  def create_y_wall(usda, wall_in)
    total_x = HOUSE_WIDTH * (wall_in.length + 1)
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: total_x, y: 1, z: 3),
      position: Usda::Coordinates.new(x: 0, y: 0, z: 1)
    )
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: total_x, y: 1, z: 1),
      position: Usda::Coordinates.new(x: 0, y: 0, z: 6)
    )

    dimension = Usda::Dimension.new(x: BETWEEN_WINDOWS_LENGTH - 1, y: 1, z: 2)
    usda.create_rectangular_cuboid(
      dimension:,
      position: Usda::Coordinates.new(x: 0, y: 0, z: 4)
    )
    usda.create_rectangular_cuboid(
      dimension:,
      position: Usda::Coordinates.new(x: total_x - BETWEEN_WINDOWS_LENGTH + 1, y: 0, z: 4)
    )

    0.upto(wall_in.length - 1) do |between_block|
      usda.create_rectangular_cuboid(
        dimension: Usda::Dimension.new(x: BETWEEN_WINDOWS_LENGTH * 2 - 2, y: 1, z: 2),
        position: Usda::Coordinates.new(x: (HOUSE_WIDTH - BETWEEN_WINDOWS_LENGTH) + (HOUSE_WIDTH * between_block), y: 0, z: 4)
      )
    end
  end

  # @param [Delta] direction_to_move
  # @param [Delta] direction_to_check
  # @return [WallInDirectionResult]
  def wall_in_direction(direction_to_move, direction_to_check)
    length = 0
    delta = direction_to_move
    while filled?(delta) && !filled?(delta + direction_to_check)
      length += 1
      delta += direction_to_move
    end
    WallInDirectionResult.new(
      length,
      filled?(-direction_to_move),
      filled?(delta) && filled?(delta + direction_to_check)
    )
  end

  class WallInDirectionResult
    # @return [Integer]
    attr_reader :length
    # @return [Boolean]
    attr_reader :corner_begin
    # @return [Boolean]
    attr_reader :corner_end

    # @param [Integer] length
    # @param [Boolean] corner_begin
    # @param [Boolean] corner_end
    def initialize(length, corner_begin, corner_end)
      @length = length
      @corner_begin = corner_begin
      @corner_end = corner_end
    end

    def to_s
      "#{self.class} length: #{length}, corner_begin: #{corner_begin}, corner_end: #{corner_end}"
    end
  end
end
