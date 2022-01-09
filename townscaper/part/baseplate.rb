class BasePlate < SetPart
  include Measures

  # @param [MeasurementNumber] x
  # @param [MeasurementNumber] z
  # @return [Hash]
  def create_position(x:, z:)
    {
      x: x + (14 * BRICK_WIDTH),
      y: -24,
      z: z + (15 * BRICK_WIDTH),
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
