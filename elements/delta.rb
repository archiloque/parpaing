class Delta
  # @return [Integer]
  attr_reader :x

  # @return [Integer]
  attr_reader :y

  # @return [Integer]
  attr_reader :z

  # @param [Integer] z
  # @param [Integer] y
  # @param [Integer] x
  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  # @param [Delta] delta
  # @return [Delta]
  def +(delta)
    Delta.new(
      @x + delta.x,
      @y + delta.y,
      @z + delta.z,
    )
  end

  # @param [Integer] value
  # @return [Delta]
  def *(value)
    Delta.new(
      @x * value,
      @y * value,
      @z * value,
    )
  end

  # @return [Delta]
  def -@()
    Delta.new(
      - @x,
      - @y,
      - @z,
      )
  end

  DELTA_FIXED = Delta.new(0, 0, 0)

  DELTA_PLUS_X = Delta.new(1, 0, 0)
  DELTA_MINUS_X = Delta.new(-1, 0, 0)

  DELTA_PLUS_Y = Delta.new(0, -1, 0)
  DELTA_MINUS_Y = Delta.new(0, 1, 0)

  DELTA_PLUS_Z = Delta.new(0, 0, 1)
  DELTA_MINUS_Z = Delta.new(0, 0, -1)
end
