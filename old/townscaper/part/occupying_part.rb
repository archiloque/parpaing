class OccupyingPart < SetPart
  # @return [NumberOfBrick]
  attr_reader :x
  # @return [NumberOfBrick]
  attr_reader :y
  # @return [NumberOfBrick]
  attr_reader :z

  # @param [NumberOfBrick] x
  # @param [NumberOfBrick] y
  # @param [NumberOfBrick] z

  def initialize(x:, y:, z:)
    @x = x
    @y = y
    @z = z
  end
end
