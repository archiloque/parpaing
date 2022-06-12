class Usda::Context
  attr_reader :material, :position

  # @param [String, nil] material
  # @param [Usda::Coordinates, nil] position
  def initialize(position: nil, material: nil)
    @position = position
    @material = material
  end
end
