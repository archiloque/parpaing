module WithParts

  # @param [UnitNumber, nil] m_y
  # @param [Color, nil] color
  def with(
    m_y: nil,
    color: nil
    )
    @default_color = color
    @default_my = m_y
    yield
    @default_color = nil
    @default_my = nil
  end

  # @param [UnitNumber, nil] m_y
  # @param [NumberOfBrick] b_x
  # @param [NumberOfBrick] b_y
  # @param [NumberOfBrick] b_z
  # @param [Color, nil] color
  # @param [SetPart] part
  # @return [void]
  def add_part(
    m_y: nil,
    b_x:,
    b_y:,
    b_z:,
    part:,
    color: nil
  )
    color = color || @default_color
    unless color
      raise "No color"
    end
    m_y = m_y || @default_my
    unless m_y
      raise "No m_y"
    end
    concat_result(
      part.create(
        color: color,
        x: (b_x * Measures::BRICK_WIDTH),
        y: m_y + (b_y * Measures::BRICK_HEIGHT),
        z: (b_z * Measures::BRICK_WIDTH),
      )
    )
  end
end