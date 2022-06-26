require_relative 'cell_positions'
require_relative 'cell_roof'
require_relative 'cell_walls'

class Cell
  include CellPositions
  include CellRoof
  include CellWalls

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
    initialize_walls
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
      )
    ) do
      usda.create_light(position: Usda::Coordinates.new(x: HOUSE_WIDTH / 2, y: HOUSE_WIDTH / 2, z: 6))
      create_walls(usda)
      unless plus_z_filled?
        create_roof(usda)
      end
    end
  end

  def to_s
    "#{self.class} (#{x}, #{y}, #{z})"
  end

end
