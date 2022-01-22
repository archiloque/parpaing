module WithParts

  # @param [UnitNumber, nil] m_y
  # @param [Color, nil] color
  def with(
    m_y: nil,
    color: nil
  )
    @contexts ||= []
    @contexts << {
      m_y: m_y,
      color: color,
    }
    yield
    @contexts.pop
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
    color = color || get_context_value(:color)
    unless color
      raise "No color"
    end
    m_y = m_y || get_context_value(:m_y)
    unless m_y
      raise "No m_y"
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
      if context.key?(param_name)
        return context[param_name]
      end
    end
    nil
  end

end