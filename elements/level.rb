class Level
  # @return [World]
  attr_reader :world

  # @return [Integer]
  attr_reader :z

  # @return [Array<Array<Cell>>]
  attr_reader :cells

  # @param [World] world
  # @param [Integer] z
  def initialize(world, z)
    @z = z
    @world = world
    @cells = []

    0.upto(@world.y_number - 1) do |y|
      cells_row = Array.new(@world.x_number)
      0.upto(@world.x_number - 1) do |x|
        if @world.map[@z][y][x]
          cells_row[x] = Cell.new(
            x: x,
            y: y,
            z: z,
            level: self,
          )
        end
      end
      @cells << cells_row
    end
  end

  # @param [Usda] usda
  #  @return [void]
  def create(usda)
    0.upto(@world.y_number - 1) do |y|
      0.upto(@world.x_number - 1) do |x|
        if @world.map[@z][y][x]
          @cells[y][x].create(usda)
        end
      end
    end
  end
end
