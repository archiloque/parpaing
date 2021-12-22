class FruitTree < SetPart
  FRUIT_TREE = Part.new('Plant, Fruit Tree', '3470')

  def initialize()
    super(
      x: 4,
      y: 6,
      z: 4,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: FRUIT_TREE,
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x * BRICK_WIDTH) + 10,
        y: (y * BRICK_HEIGHT) - 12,
        z: (z * BRICK_WIDTH) + 10,
      ),
    ]
  end
end

class PineTree < SetPart
  PINE_TREE = Part.new('Plant, Pine Tree, Large, 4 x 4 x 6 2/3', '3471')

  def initialize()
    super(
      x: 4,
      y: 7,
      z: 4,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: PINE_TREE,
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x * BRICK_WIDTH) + 10,
        y: (y * BRICK_HEIGHT) - 12,
        z: (z * BRICK_WIDTH) + 10,
      ),
    ]
  end
end