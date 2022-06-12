module Material
  BLUE = 'Blue'
  GREEN = 'Green'
  RED = 'Red'
  WHITE = 'White'
  YELLOW = 'Yellow'

  # @param [Usda] usda
  def self.initialize(usda)
    usda.create_material(BLUE, Usda::Color.new(r: 30, g: 90, b: 169))
    usda.create_material(GREEN, Usda::Color.new(r: 0, g: 133, b: 43))
    usda.create_material(RED, Usda::Color.new(r: 180, g: 0, b: 0))
    usda.create_material(WHITE, Usda::Color.new(r: 244, g: 244, b: 244))
    usda.create_material(YELLOW, Usda::Color.new(r: 250, g: 200, b: 10))
  end
end
