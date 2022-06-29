class Usda::Context
  attr_reader :dimension, :material, :position

  # @param [Usda::Dimension, nil] dimension
  # @param [String, nil] material
  # @param [Usda::Coordinates, nil] position
  def initialize(dimension: nil, material: nil, position: nil)
    @dimension = dimension
    @material = material
    @position = position
  end
end
