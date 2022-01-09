module WithWalls

  # @param [MeasurementNumber] m_x
  # @param [MeasurementNumber] m_y
  # @param [MeasurementNumber] m_z
  # @param [BrickNumber] b_y
  # @param [BrickNumber] b_z
  # @param [BrickNumber] b_from_x
  # @param [BrickNumber] b_to_x
  # @return [void]
  def create_wall_along_x(
    m_x:,
    m_y:,
    m_z:,
    b_y:,
    b_z:,
    b_from_x:,
    b_to_x:)
    current_from_x = b_from_x
    while occupied?(x: current_from_x, y: b_y, z: b_z)
      current_from_x += 1.to_b
    end
    if current_from_x >= b_to_x
      return
    end
    current_to_x = current_from_x
    while (current_to_x < b_to_x) && (!occupied?(x: current_to_x, y: b_y, z: b_z))
      current_to_x += 1.to_b
    end
    create_wall_segment_along_x(
      m_x: m_x,
      m_y: m_y,
      m_z: m_z,
      b_y: b_y,
      b_z: b_z,
      b_from_x: current_from_x,
      b_to_x: current_to_x,
    )
    if current_to_x < b_to_x
      create_wall_along_x(
        m_x: m_x,
        m_y: m_y,
        m_z: m_z,
        b_y: b_y,
        b_z: b_z,
        b_from_x: current_to_x + 1,
        b_to_x: b_to_x,
      )
    end
  end

  # @param [MeasurementNumber] m_x
  # @param [MeasurementNumber] m_y
  # @param [MeasurementNumber] m_z
  # @param [BrickNumber] b_y
  # @param [BrickNumber] b_z
  # @param [BrickNumber] b_from_x
  # @param [BrickNumber] b_to_x
  # @return [void]
  def create_wall_segment_along_x(
    m_x:,
    m_y:,
    m_z:,
    b_y:,
    b_z:,
    b_from_x:,
    b_to_x:
  )
    length = b_to_x - b_from_x
    elements = SetPart.calculate_fit(length, Brick::BY_SIZE_X)
    if b_y % 2 == 1
      elements = elements.reverse
    end
    current_x = b_from_x
    elements.each do |element|
      part = element.part_class.new
      add_part(
        m_x: m_x,
        m_y: m_y,
        m_z: m_z,
        b_x: current_x,
        b_y: b_y,
        b_z: b_z,
        part: part,
        color: Color::BLACK,
      )
      current_x += element.size
    end
  end

  # @param [MeasurementNumber] m_x
  # @param [MeasurementNumber] m_y
  # @param [MeasurementNumber] m_z
  # @param [BrickNumber] x
  # @param [BrickNumber] b_y
  # @param [BrickNumber] b_from_z
  # @param [BrickNumber] b_to_z
  # @return [void]
  def create_wall_along_z(
    m_x:,
    m_y:,
    m_z:,
    b_y:,
    b_x:,
    b_from_z:,
    b_to_z:
  )
    current_from_z = b_from_z
    while occupied?(z: current_from_z, y: b_y, x: b_x)
      current_from_z += 1.to_b
    end
    if current_from_z >= b_to_z
      return
    end
    current_to_z = current_from_z
    while (current_to_z < b_to_z) && (!occupied?(z: current_to_z, y: b_y, x: b_x))
      current_to_z += 1.to_b
    end
    create_wall_segment_along_z(
      m_x: m_x,
      m_y: m_y,
      m_z: m_z,
      b_y: b_y,
      b_x: b_x,
      b_from_z: current_from_z,
      b_to_z: current_to_z,
    )
    if current_to_z < b_to_z
      create_wall_along_z(
        m_x: m_x,
        m_y: m_y,
        m_z: m_z,
        b_y: b_y,
        b_x: b_x,
        b_from_z: current_to_z + 1.to_b,
        b_to_z: b_to_z,
      )
    end
  end

  # @param [MeasurementNumber] m_x
  # @param [MeasurementNumber] m_y
  # @param [MeasurementNumber] m_z
  # @param [BrickNumber] b_y
  # @param [BrickNumber] b_x
  # @param [BrickNumber] b_from_z
  # @param [BrickNumber] b_to_z
  # @return [void]
  def create_wall_segment_along_z(
    m_x:,
    m_y:,
    m_z:,
    b_y:,
    b_x:,
    b_from_z:,
    b_to_z:)
    length = b_to_z - b_from_z
    elements = SetPart.calculate_fit(length, Brick::BY_SIZE_Z)
    if b_y % 2 == 1
      elements = elements.reverse
    end
    current_z = b_from_z
    elements.each do |element|
      part = element.part_class.new
      add_part(
        m_x: m_x,
        m_y: m_y,
        m_z: m_z,
        b_x: b_x,
        b_y: b_y,
        b_z: current_z,
        part: part,
        color: Color::BLACK,
      )
      current_z += element.size
    end
  end

  # @param [MeasurementNumber] m_x
  # @param [MeasurementNumber] m_y
  # @param [MeasurementNumber] m_z
  # @param [BrickNumber] b_x
  # @param [BrickNumber] b_y
  # @param [BrickNumber] b_z
  # @param [Color] color
  # @param [SetPart] part
  # @return [void]
  def add_part(
    m_x:,
    m_y:,
    m_z:,
    b_x:,
    b_y:,
    b_z:,
    part:,
    color:
  )
    concat_result(
      part.create(
        color: color,
        x: (m_x.number + (b_x.number * Measures::BRICK_WIDTH)).to_m,
        y: (m_y.number + (b_y.number * Measures::BRICK_HEIGHT)).to_m,
        z: (m_z.number + (b_z.number * Measures::BRICK_WIDTH)).to_m,
      )
    )
  end
end