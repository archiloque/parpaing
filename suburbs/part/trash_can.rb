class TrashCan < SetPart
  TRASH_CAN = Part.new('Trash Can with 4 Cover Holders', '92926')
  DISH = Part.new('Dish 2 x 2 Inverted', '4740')

  def initialize()
    super(
      x: 2,
      y: 3,
      z: 2,
    )
  end

  def create(color:, x:, y:, z:)
    x_position = (x * BRICK_WIDTH) - 10
    z_position = (z * BRICK_WIDTH) - 10
    [
      Emitter.emit(
        part: TRASH_CAN,
        color: color,
        orientation: PartOrientation::Z_90,
        x: x_position,
        y: (y * BRICK_HEIGHT) - 52,
        z: z_position,
      ),
      Emitter.emit(
        part: DISH,
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: x_position,
        y: (y * BRICK_HEIGHT) - 60,
        z: z_position,
      ),
    ]
  end
end
