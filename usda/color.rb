class Usda::Color
  attr_reader :r, :g, :b

  # @param [Integer] r
  # @param [Integer] g
  # @param [Integer] b
  def initialize(r:, g:, b:)
    @r = r.to_f / 255.0
    @g = g.to_f / 255.0
    @b = b.to_f / 255.0
  end
end
