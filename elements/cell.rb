require_relative 'cell_pillars'
require_relative 'cell_positions'
require_relative 'cell_roof'
require_relative 'cell_walls'

class Cell
  include CellPositions
  include CellPillars
  include CellRoof
  include CellWalls

  HOUSE_WIDTH = 12
  WINDOWS_WIDTH = 4
  HOUSE_HEIGHT = 7
  BETWEEN_WINDOWS_LENGTH = (HOUSE_WIDTH - WINDOWS_WIDTH) / 2

  # @return [Integer]
  attr_reader :x
  # @return [Integer]
  attr_reader :y
  # @return [Integer]
  attr_reader :z
  # @return [Level]
  attr_reader :level
  # @return [Boolean]
  attr_reader :minus_x_wall
  # @return [Boolean]
  attr_reader :minus_y_wall
  # @return [Boolean]
  attr_reader :plus_x_wall
  # @return [Boolean]
  attr_reader :plus_y_wall
  # @return [Integer]
  attr_reader :cell_x
  # @return [Integer]
  attr_reader :cell_y
  # @return [Integer]
  attr_reader :cell_z

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
    @cell_x = @x * HOUSE_WIDTH
    @cell_y = -@y * HOUSE_WIDTH
    @cell_z = @z * HOUSE_HEIGHT + World::WORLD_BOTTOM
    initialize_walls
  end

  # @param [USDA] usda
  # @return [void]
  def create(usda)
    house_position = Usda::Coordinates.new(
      x: cell_x,
      y: cell_y,
      z: cell_z
    )

    usda.with(
      position: house_position,
    ) do
      usda.create_light(
        position: Usda::Coordinates.new(
          x: HOUSE_WIDTH / 2,
          y: HOUSE_WIDTH / 2,
          z: 6)
      )
      create_pillars(usda)
      create_roof(usda)
      create_walls(usda)
    end
  end

  def to_s
    "#{self.class} (#{x}, #{y}, #{z})"
  end

end
