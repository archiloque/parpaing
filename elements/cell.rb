class Cell
  HOUSE_WIDTH = 12
  HOUSE_HEIGHT = 8

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
      z: @level_index * HOUSE_HEIGHT,
    )

    usda.with(Usda::Context.new(
      position: house_position,
      material: Material::YELLOW,
    )) do
      usda.create_light(position: Usda::Coordinates.new(x: HOUSE_WIDTH / 2, y: HOUSE_WIDTH / 2, z: 6))

      usda.create_rectangular_cuboid(
        dimension: Usda::Dimension.new(x: HOUSE_WIDTH, y: HOUSE_WIDTH, z: 1),
        position: Usda::Coordinates.new(x: 0, y: 0, z: 0),
      )

      0.upto(6) do |level|
        unless [6 - 1, 6 - 2].include?(level)
          dimension_1 = Usda::Dimension.new(x: 1, y: HOUSE_WIDTH, z: 1)
          usda.create_rectangular_cuboid(
            dimension: dimension_1,
            position: Usda::Coordinates.new(x: 0, y: 0, z: level + 1),
          )
          usda.create_rectangular_cuboid(
            dimension: dimension_1,
            position: Usda::Coordinates.new(x: HOUSE_WIDTH - 1, y: 0, z: level + 1),
          )

          dimension_2 = Usda::Dimension.new(x: HOUSE_WIDTH - 2, y: 1, z: 1)
          usda.create_rectangular_cuboid(
            dimension: dimension_2,
            position: Usda::Coordinates.new(x: 1, y: 0, z: level + 1),
          )
          usda.create_rectangular_cuboid(
            dimension: dimension_2,
            position: Usda::Coordinates.new(x: 1, y: HOUSE_WIDTH - 1, z: level + 1),
          )
        end
      end

      [6 - 1, 6 - 2].each do |level|
        dimension_1 = Usda::Dimension.new(x: 1, y: (HOUSE_WIDTH / 2) - 2, z: 1)
        usda.create_rectangular_cuboid(
          dimension: dimension_1,
          position: Usda::Coordinates.new(x: 0, y: 0, z: level + 1),
        )
        usda.create_rectangular_cuboid(
          dimension: dimension_1,
          position: Usda::Coordinates.new(x: 0, y: (HOUSE_WIDTH / 2) + 2, z: level + 1),
        )

        usda.create_rectangular_cuboid(
          dimension: dimension_1,
          position: Usda::Coordinates.new(x: HOUSE_WIDTH - 1, y: 0, z: level + 1),
        )
        usda.create_rectangular_cuboid(
          dimension: dimension_1,
          position: Usda::Coordinates.new(x: HOUSE_WIDTH - 1, y: (HOUSE_WIDTH / 2) + 2, z: level + 1),
        )

        dimension_2 = Usda::Dimension.new(x: ((HOUSE_WIDTH - 2) / 2) - 2, y: 1, z: 1)
        usda.create_rectangular_cuboid(
          dimension: dimension_2,
          position: Usda::Coordinates.new(x: 1, y: 0, z: level + 1),
        )
        usda.create_rectangular_cuboid(
          dimension: dimension_2,
          position: Usda::Coordinates.new(x: 1, y: HOUSE_WIDTH - 1, z: level + 1),
        )

        usda.create_rectangular_cuboid(
          dimension: dimension_2,
          position: Usda::Coordinates.new(x: 1 + (HOUSE_WIDTH / 2) + 1, y: 0, z: level + 1),
        )
        usda.create_rectangular_cuboid(
          dimension: dimension_2,
          position: Usda::Coordinates.new(x: 1 + (HOUSE_WIDTH / 2) + 1, y: HOUSE_WIDTH - 1, z: level + 1),
        )
      end

      unless @level.world.filled?(column: @column, line: @line, level: @level_index + 1)
        0.upto((HOUSE_WIDTH / 2) - 1).each do |roof_level|
          width = (HOUSE_WIDTH) - (roof_level * 2)
          usda.create_rectangular_cuboid(
            material: Material::RED,
            dimension: Usda::Dimension.new(x: width, y: width, z: 1),
            position: Usda::Coordinates.new(x: 0 + roof_level, y: 0 + roof_level, z: 6 + 2 + roof_level),
          )
        end
      end
    end
  end
end
