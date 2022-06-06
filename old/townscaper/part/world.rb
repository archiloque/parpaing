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

  # @param [IO] output
  # @return [void]
  def create(output)
    create_water(output)
    @levels.each do |level|
      level.create(output)
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

  private

  # @param [IO] output
  # @return [nil]
  def create_water(output)
    line_width_in_brick = Cell::WIDTH_IN_BRICKS.number * @lines_number
    column_width_in_brick = Cell::WIDTH_IN_BRICKS.number * @columns_number
    line_number_base_plates = (line_width_in_brick.to_f / Measures::BASEPLATE_WIDTH.number).ceil
    column_number_base_plates = (column_width_in_brick.to_f / Measures::BASEPLATE_WIDTH.number).ceil
    line_width_base_plates = Measures::BASEPLATE_WIDTH.number * line_number_base_plates
    column_width_base_plates = Measures::BASEPLATE_WIDTH.number * column_number_base_plates
    line_delta = (line_width_base_plates - line_width_in_brick) / 2
    column_delta = (column_width_base_plates - column_width_in_brick) / 2

    0.upto(line_number_base_plates - 1) do |line_index|
      0.upto(column_number_base_plates - 1) do |column_index|
        BasePlate.new.create(
          x: (-column_delta - (Measures::BASEPLATE_WIDTH.number * column_index)).to_b * Measures::BRICK_WIDTH,
          z: (-line_delta + (Measures::BASEPLATE_WIDTH.number * line_index)).to_b * Measures::BRICK_WIDTH,
          y: (2.to_b * Measures::BRICK_HEIGHT) - Measures::STUD_HEIGHT,
          color: Color::BLUE,
        ).each do |line|
          output << line
        end
      end
    end
  end
end
