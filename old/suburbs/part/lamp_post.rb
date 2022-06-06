class LampPost < SetPart
  LAMP_POST = Part.new('Lamp Post 2 x 2 x 7 with 4 Base Flutes', '11062')
  MINIFIG_HEAD_PLAIN = Part.new('Minifig Head Plain', '3626b')
  DISCH = Part.new('Dish 2 x 2 Inverted', '4740')

  def initialize()
    super(
      x: 2,
      y: 8,
      z: 2,
    )
  end

  def create(color:, x:, y:, z:)
    x_position = (x * BRICK_WIDTH) + 10
    z_position = (z * BRICK_WIDTH) + 10
    [
      Emitter.emit(
        part: LAMP_POST,
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: x_position,
        y: (y * BRICK_HEIGHT) - 172,
        z: z_position,
      ),
      Emitter.emit(
        part: MINIFIG_HEAD_PLAIN,
        color: Color::TRANS_YELLOW,
        orientation: PartOrientation::DEFAULT,
        x: x_position,
        y: (y * BRICK_HEIGHT) - 196,
        z: z_position,
      ),
      Emitter.emit(
        part: DISCH,
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: x_position,
        y: (y * BRICK_HEIGHT) - 204,
        z: z_position,
      ),
    ]
  end
end
