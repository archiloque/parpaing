class World
  WORLD_BOTTOM = 1

  # @return [Array<Array<Array<Boolean>>>]
  attr_reader :map

  # @return [Array<Level>]
  attr_reader :levels

  # @return [Integer]
  attr_reader :x_number

  # @return [Integer]
  attr_reader :y_number

  # @return [Integer]
  attr_reader :z_number

  # @param [Integer] x_number
  # @param [Integer] y_number
  # @param [Integer] z_number
  # @param [Array<Array<Array<Boolean>>>] map
  def initialize(x_number, y_number, z_number, map)
    @x_number = x_number
    @y_number = y_number
    @z_number = z_number
    @map = map
    @levels = []
    0.upto(@z_number - 1) do |z_index|
      @levels << Level.new(self, z_index)
    end
  end

  # @param [Usda] usda
  # @return [void]
  def create(usda)
    create_sea(usda)
    @levels.each do |level|
      level.create(usda)
    end
  end

  SEA_DELTA = 5

  # @param [Usda] usda
  def create_sea(usda)
    usda.create_rectangular_cuboid(
      position: Usda::Coordinates.new(
        x: -SEA_DELTA,
        y: - (y_number * Cell::HOUSE_WIDTH) + SEA_DELTA,
        z: 0
      ),
      dimension: Usda::Dimension.new(
        x: (x_number * Cell::HOUSE_WIDTH) + (SEA_DELTA * 2),
        y: (y_number * Cell::HOUSE_WIDTH) + (SEA_DELTA * 2),
        z: 1
      ),
      material: Material::BLUE
    )
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [Boolean]
  def filled?(x:, y:, z:)
    if (x < 0) ||
      (y < 0) ||
      (z < 0) ||
      (x >= @x_number) ||
      (y >= @y_number) ||
      (z >= @z_number)
      false
    else
      map[z][y][x] || false
    end
  end
end
