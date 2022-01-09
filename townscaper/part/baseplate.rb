class BasePlate < SetPart
  # @param [DrawUnit] x
  # @param [DrawUnit] z
  # @return [Hash]
  def create_position(x:, z:)
    {
      x: x + (14.to_b * MeasureNumber.BRICK_WIDTH),
      y: -24.to_b,
      z: z + (15.to_b * MeasureNumber.BRICK_WIDTH),
    }
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        **{
          part: Part.new('Baseplate 32 x 32', '3811'),
          color: Color::BLUE,
          orientation: PartOrientation::O_0,
        }.merge(create_position(x: x, z: z))
      )
    ]
  end
end
