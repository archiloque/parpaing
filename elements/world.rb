class World
  # @return [Array<Array<Array<Boolean>>>]
  attr_reader :map

  # @return [Integer]
  attr_reader :columns_number

  # @return [Integer]
  attr_reader :lines_number

  # @return [Integer]
  attr_reader :levels_number

  # @param [Integer] columns_number
  # @param [Integer] lines_number
  # @param [Integer] levels_number
  # @param [Array<Array<Array<Boolean>>>] map
  def initialize(columns_number, lines_number, levels_number, map)
    @columns_number = columns_number
    @lines_number = lines_number
    @levels_number = levels_number
    @map = map
    @levels = []
    0.upto(@levels_number - 1) do |level_index|
      @levels << Level.new(self, level_index)
    end
  end

  # @param [Usda] usda
  # @return [void]
  def create(usda)
    @levels.each do |level|
      level.create(usda)
    end
  end

  # @param [Integer] level
  # @param [Integer] column
  # @param [Integer] line
  # @return [Boolean]
  def filled?(column:, line:, level:)
    if (line < 0) ||
      (column < 0) ||
      (level < 0) ||
      (line >= @lines_number) ||
      (column >= @columns_number) ||
      (level >= @levels_number)
      false
    else
      map[level][line][column] || false
    end
  end
end
