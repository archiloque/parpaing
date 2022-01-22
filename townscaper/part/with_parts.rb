module WithParts

  # @param [UnitNumber, nil] m_y
  # @param [Color, nil] color
  # @param [NumberOfBrick, il] b_x
  # @param [NumberOfBrick, il] b_y
  # @param [NumberOfBrick, il] b_z
  # @return [void]
  def with(
    m_y: nil,
    color: nil,
    b_x: nil,
    b_y: nil,
    b_z: nil
  )
    @contexts ||= []
    @contexts << {
      m_y: m_y,
      color: color,
      b_x: b_x,
      b_y: b_y,
      b_z: b_z,
    }
    yield
    @contexts.pop
  end

  # @param [UnitNumber, nil] m_y
  # @param [NumberOfBrick, nil] b_x
  # @param [NumberOfBrick, nil] b_y
  # @param [NumberOfBrick, nil] b_z
  # @param [Color, nil] color
  # @param [SetPart] part
  # @return [void]
  def add_part(
    m_y: nil,
    b_x: nil,
    b_y: nil,
    b_z: nil,
    part:,
    color: nil
  )
    color ||= get_context_value(:color)
    unless color
      raise "No color"
    end
    m_y ||= get_context_value(:m_y)
    unless m_y
      raise "No m_y"
    end
    b_x ||= get_context_value(:b_x)
    unless b_x
      raise "No b_x"
    end
    b_y ||= get_context_value(:b_y)
    unless b_y
      raise "No b_y"
    end
    b_z ||= get_context_value(:b_z)
    unless b_z
      raise "No b_z"
    end

    concat_result(
      part.create(
        color: color,
        x: ((b_x + @x_origin) * Measures::BRICK_WIDTH),
        y: m_y + (b_y * Measures::BRICK_HEIGHT),
        z: ((b_z + @z_origin) * Measures::BRICK_WIDTH),
      )
    )
  end

  private

  # @param [Symbol] param_name
  # @return [Object]
  def get_context_value(param_name)
    @contexts.reverse.each do |context|
      if context[param_name]
        return context[param_name]
      end
    end
    nil
  end

end