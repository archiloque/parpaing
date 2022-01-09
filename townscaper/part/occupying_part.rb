class OccupyingPart < SetPart
  # @return [BrickNumber]
  attr_reader :x
  # @return [BrickNumber]
  attr_reader :y
  # @return [BrickNumber]
  attr_reader :z

  # @param [BrickNumber] x
  # @param [BrickNumber] y
  # @param [BrickNumber] z
  def initialize(x:, y:, z:)
    @x = x
    @y = y
    @z = z
  end
end
