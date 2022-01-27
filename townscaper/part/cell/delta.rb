class Delta
  # @return [Integer]
  attr_reader :x

  # @return [Integer]
  attr_reader :y

  # @return [Integer]
  attr_reader :z

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def +(delta)
    Delta.new(
      @x + delta.x,
      @y + delta.y,
      @z + delta.z,
    )
  end

  DELTA_NORTH = Delta.new(0, 0, -1)
  DELTA_SOUTH = Delta.new(0, 0, 1)
  DELTA_EAST = Delta.new(1, 0, 0)
  DELTA_WEST = Delta.new(-1, 0, 0)
  DELTA_UP = Delta.new(0, 1, 0)
end
