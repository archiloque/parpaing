class Level
  # @return [World]
  attr_reader :world

  # @return [Integer]
  attr_reader :index

  # @param [World] world
  # @param [Integer] index
  def initialize(world, index)
    @index = index
    @world = world
  end

  # @param [IO] output
  # @return [void]
  def create(output)
    create_cells(output)
  end

  private

  # @param [IO] output
  # @return [void]
  def create_cells(output)
    0.upto(@world.lines_number - 1) do |line|
      0.upto(@world.columns_number - 1) do |column|
        if @world.map[@index][line][column]
          Cell.new(
            x_index: column,
            y_origin: -(Cell::HEIGHT_IN_UNIT * (@index - 1)),
            z_index: line,
            level: self,
          ).create(output)
        end
      end
    end
  end
end
