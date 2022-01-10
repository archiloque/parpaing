class BasePlate < SetPart
  # @param [DrawUnit] x
  # @param [DrawUnit] y
  # @param [DrawUnit] z
  # @return [Hash]
  def create_position(x:, y:, z:)
    {
      x: x + (15.to_b * Measures::BRICK_WIDTH) + HALF_BRICK_WIDTH,
      y: y,
      z: z + (15.to_b * Measures::BRICK_WIDTH) + HALF_BRICK_WIDTH,
    }
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        **{
          part: Part.new('Baseplate 32 x 32', '3811'),
          color: Color::BLUE,
          orientation: PartOrientation::O_0,
        }.merge(create_position(x: x, y: y, z: z))
      )
    ]
  end
end
