class Usda::Dimension
  attr_reader :x, :y, :z

  # @param [Float, Integer] x
  # @param [Float, Integer] y
  # @param [Float, Integer] z
  def initialize(x:, y:, z:)
    @x = x
    @y = y
    @z = z
  end
end
