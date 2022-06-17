require_relative 'cell_positions'

class Cell
  include CellPositions

  HOUSE_WIDTH = 12
  HOUSE_HEIGHT = 7

  attr_reader :level, :column, :line

  # @param [Integer] column
  # @param [DrawUnit] line
  # @param [Integer] level_index
  # @param [Level] level
  def initialize(
    column:,
    line:,
    level_index:,
    level:
  )
    @column = column
    @line = line
    @level_index = level_index
    @level = level
  end

  # @param [USDA] usda
  # @return [void]
  def create(usda)
    house_position = Usda::Coordinates.new(
      x: @column * HOUSE_WIDTH,
      y: @line * HOUSE_WIDTH,
      z: @level_index * HOUSE_HEIGHT
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
      create_north_wall(usda)
      create_south_wall(usda)
      create_east_wall(usda)
      create_west_wall(usda)
      create_roof(usda)
    end
  end

  private

  def create_roof(usda)
    unless up_filled?
      0.upto((HOUSE_WIDTH / 2) - 1).each do |roof_level|
        width = HOUSE_WIDTH - (roof_level * 2)
        usda.create_rectangular_cuboid(
          material: Material::RED,
          dimension: Usda::Dimension.new(x: width, y: width, z: 1),
          position: Usda::Coordinates.new(x: roof_level, y: roof_level, z: 7 + roof_level)
        )
      end
    end
  end

  def create_north_wall(usda)
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: HOUSE_WIDTH, y: 1, z: 3),
      position: Usda::Coordinates.new(x: 0, y: 0, z: 1)
    )

    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: HOUSE_WIDTH, y: 1, z: 1),
      position: Usda::Coordinates.new(x: 0, y: 0, z: 6)
    )

    dimension = Usda::Dimension.new(x: (HOUSE_WIDTH / 2) - 2, y: 1, z: 2)
    usda.create_rectangular_cuboid(
      dimension: dimension,
      position: Usda::Coordinates.new(x: 0, y: 0, z: 4)
    )
    usda.create_rectangular_cuboid(
      dimension: dimension,
      position: Usda::Coordinates.new(x: 1 + (HOUSE_WIDTH / 2) + 1, y: 0, z: 4)
    )
  end

  def create_south_wall(usda)
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: HOUSE_WIDTH, y: 1, z: 3),
      position: Usda::Coordinates.new(x: 0, y: HOUSE_WIDTH - 1, z: 1)
    )

    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: HOUSE_WIDTH, y: 1, z: 1),
      position: Usda::Coordinates.new(x: 0, y: HOUSE_WIDTH - 1, z: 6)
    )

    dimension = Usda::Dimension.new(x: (HOUSE_WIDTH / 2) - 2, y: 1, z: 2)
    usda.create_rectangular_cuboid(
      dimension: dimension,
      position: Usda::Coordinates.new(x: 0, y: HOUSE_WIDTH - 1, z: 4)
    )

    usda.create_rectangular_cuboid(
      dimension: dimension,
      position: Usda::Coordinates.new(x: 1 + (HOUSE_WIDTH / 2) + 1, y: HOUSE_WIDTH - 1, z: 4)
    )
  end

  def create_east_wall(usda)
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: 1, y: HOUSE_WIDTH - 2, z: 3),
      position: Usda::Coordinates.new(x: HOUSE_WIDTH - 1, y: 1, z: 1)
    )

    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: 1, y: HOUSE_WIDTH - 2, z: 1),
      position: Usda::Coordinates.new(x: HOUSE_WIDTH - 1, y: 1, z: 6)
    )

    dimension = Usda::Dimension.new(x: 1, y: ((HOUSE_WIDTH - 2) / 2) - 2, z: 2)
    usda.create_rectangular_cuboid(
      dimension: dimension,
      position: Usda::Coordinates.new(x: HOUSE_WIDTH - 1, y: 1, z: 4)
    )
    usda.create_rectangular_cuboid(
      dimension: dimension,
      position: Usda::Coordinates.new(x: HOUSE_WIDTH - 1, y: (HOUSE_WIDTH / 2) + 2, z: 4)
    )
  end

  def create_west_wall(usda)
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: 1, y: HOUSE_WIDTH - 2, z: 3),
      position: Usda::Coordinates.new(x: 0, y: 1, z: 1)
    )

    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: 1, y: HOUSE_WIDTH - 2, z: 1),
      position: Usda::Coordinates.new(x: 0, y: 1, z: 6)
    )

    dimension = Usda::Dimension.new(x: 1, y: ((HOUSE_WIDTH - 2) / 2) - 2, z: 2)
    usda.create_rectangular_cuboid(
      dimension: dimension,
      position: Usda::Coordinates.new(x: 0, y: 1, z: 4)
    )
    usda.create_rectangular_cuboid(
      dimension: dimension,
      position: Usda::Coordinates.new(x: 0, y: (HOUSE_WIDTH / 2) + 2, z: 4)
    )
  end
end
