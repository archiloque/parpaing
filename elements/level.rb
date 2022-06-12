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

  # @param [Usda] usda
  #  @return [void]
  def create(usda)
    0.upto(@world.lines_number - 1) do |line|
      0.upto(@world.columns_number - 1) do |column|
        if @world.map[@index][line][column]
          Cell.new(
            column: column,
            line: line,
            level_index: index,
            level: self,
            ).create(usda)
        end
      end
    end
  end
end
