class Level
  include WithResult

  # @param [Integer] columns
  # @param [Integer] lines
  # @param [Array<Array<Boolean>>] map
  def initialize(columns, lines, map)
    @map = map
    @columns = columns
    @lines = lines
  end

  # @return [Array<String>]
  def create
    0.upto(@lines - 1) do |line|
      0.upto(@columns - 1) do |column|
        if @map[line][column]
          concat_result(Cell.new(
            x_index: column,
            y_origin: 0.to_u,
            z_index: line,
            level: self,
          ).create)
        end
      end
    end
    line_width_in_brick = Cell::WIDTH_IN_BRICKS.number * @lines
    column_width_in_brick = Cell::WIDTH_IN_BRICKS.number * @columns
    line_number_base_plates = (line_width_in_brick.to_f / Measures::BASEPLATE_WIDTH.number).ceil
    column_number_base_plates = (column_width_in_brick.to_f / Measures::BASEPLATE_WIDTH.number).ceil
    line_width_base_plates = Measures::BASEPLATE_WIDTH.number * line_number_base_plates
    column_width_base_plates = Measures::BASEPLATE_WIDTH.number * column_number_base_plates
    line_delta = (line_width_base_plates - line_width_in_brick) / 2
    column_delta = (column_width_base_plates - column_width_in_brick) / 2

    0.upto(line_number_base_plates - 1) do |line_index|
      0.upto(column_number_base_plates - 1) do |column_index|
        concat_result(
          BasePlate.new.create(
            x: (-column_delta + (Measures::BASEPLATE_WIDTH.number * column_index)).to_b * Measures::BRICK_WIDTH,
            z: (-line_delta + (Measures::BASEPLATE_WIDTH.number * line_index)).to_b * Measures::BRICK_WIDTH,
            y: (2.to_b * Measures::BRICK_HEIGHT) - Measures::STUD_HEIGHT,
            color: Color::BLUE,
          )
        )
      end
    end
    result
  end

  # @param [Integer] x_index
  # @param [Integer] z_index
  # @return [Boolean]
  def filled?(x_index, z_index)
    if (z_index < 0) || (x_index < 0) || (z_index >= @lines) || (x_index >= @columns)
      false
    else
      @map[z_index][x_index] || false
    end
  end
end