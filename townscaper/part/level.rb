class Level
  # @return [World]
  attr_reader :world

  # @return [Integer]
  attr_reader :level_index

  # @param [World] world
  # @param [Integer] level_index
  def initialize(world, level_index)
    @level_index = level_index
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
        if @world.map[@level_index][line][column]
          Cell.new(
            x_index: column,
            y_origin: -(Cell::HEIGHT_IN_UNIT * (@level_index - 1)),
            z_index: line,
            level: self,
          ).create(output)
        end
      end
    end
  end
end
