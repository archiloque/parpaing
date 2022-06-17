class Delta
  # @return [Integer]
  attr_reader :column

  # @return [Integer]
  attr_reader :level

  # @return [Integer]
  attr_reader :line

  # @param [Integer] level
  # @param [Integer] column
  # @param [Integer] line
  def initialize(level, column, line)
    @level = level
    @column = column
    @line = line
  end

  # @param [Delta] delta
  # @return [Delta]
  def +(delta)
    Delta.new(
      @column + delta.column,
      @level + delta.level,
      @line + delta.line,
    )
  end

  # @param [Integer] value
  # @return [Delta]
  def *(value)
    Delta.new(
      @column * value,
      @level * value,
      @line * value,
    )
  end

  DELTA_FIXED = Delta.new(0, 0, 0)

  DELTA_NORTH = Delta.new(0, 1, 0)
  DELTA_SOUTH = Delta.new(0, -1, 0)
  DELTA_EAST = Delta.new(0, 0, 1)
  DELTA_WEST = Delta.new(0, 0, -1)
  DELTA_UP = Delta.new(1, 0, 0)
  DELTA_DOWN = Delta.new(-1, 0, 0)
end
