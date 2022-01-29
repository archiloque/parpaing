module WithParts

  # @param [UnitNumber, nil] m_y
  # @param [Color, nil] color
  # @param [NumberOfBrick, nil] b_x
  # @param [NumberOfBrick, nil] b_y
  # @param [NumberOfBrick, nil] b_z
  # @param [SetPart, nil] part
  # @param [Io] output
  # @return [void]
  def with(
    m_y: nil,
    color: nil,
    b_x: nil,
    b_y: nil,
    b_z: nil,
    part: nil,
    output: nil
  )
    @contexts ||= []
    @contexts << {
      m_y: m_y,
      color: color,
      b_x: b_x,
      b_y: b_y,
      b_z: b_z,
      part: part,
      output: output,
    }
    yield
    @contexts.pop
  end

  # @param [UnitNumber, nil] m_y
  # @param [NumberOfBrick, nil] b_x
  # @param [NumberOfBrick, nil] b_y
  # @param [NumberOfBrick, nil] b_z
  # @param [SetPart, nil] part
  # @param [Color, nil] color
  # @param [Io] output
  # @return [void]
  def add_part(
    m_y: nil,
    b_x: nil,
    b_y: nil,
    b_z: nil,
    part: nil,
    color: nil,
    output: nil
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
    output ||= get_context_value(:output)
    unless output
      raise "No output"
    end

    part ||= get_context_value(:part)
    unless part
      raise "No part"
    end

    part.create(
      color: color,
      x: ((b_x + x_origin) * Measures::BRICK_WIDTH),
      y: y_origin + m_y + (b_y * Measures::BRICK_HEIGHT),
      z: ((b_z + z_origin) * Measures::BRICK_WIDTH),
    ).each do |line|
      output << line
    end
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