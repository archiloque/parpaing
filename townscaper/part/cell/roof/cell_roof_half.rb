module CellRoofHalf

  # @return [void]
  def create_roof_half_north
    0.upto(2) do |i|
      add_part(
        m_y: roof_base_height,
        b_x: @x_origin + (4.to_b * i),
        b_y: 0.to_b,
        b_z: @z_origin,
        part: Slope333X4North.new,
        color: Color::RED
      )
      add_part(
        m_y: roof_base_height,
        b_x: @x_origin + (4.to_b * i),
        b_y: -1.to_b,
        b_z: @z_origin + 2.to_b,
        part: Slope333X4North.new,
        color: Color::RED
      )
    end
    0.upto(1) do |i|
      add_part(
        m_y: roof_base_height,
        b_x: @x_origin + (6.to_b * i),
        b_y: -2.to_b,
        b_z: @z_origin + 4.to_b,
        part: Slope452X6North.new,
        color: Color::RED
      )
    end
  end

  # @return [void]
  def create_roof_half_south
    0.upto(2) do |i|
      add_part(
        m_y: roof_base_height,
        b_x: @x_origin + (4.to_b * i),
        b_y: 0.to_b,
        b_z: @z_origin + 9.to_b,
        part: Slope333X4South.new,
        color: Color::RED
      )
      add_part(
        m_y: roof_base_height,
        b_x: @x_origin + (4.to_b * i),
        b_y: -1.to_b,
        b_z: @z_origin + 7.to_b,
        part: Slope333X4South.new,
        color: Color::RED
      )
    end
    0.upto(1) do |i|
      add_part(
        m_y: roof_base_height,
        b_x: @x_origin + (6.to_b * i),
        b_y: -2.to_b,
        b_z: @z_origin + 6.to_b,
        part: Slope452X6South.new,
        color: Color::RED
      )
    end
  end

  # @return [void]
  def create_roof_half_east
    0.upto(2) do |i|
      add_part(
        m_y: roof_base_height,
        b_x: @x_origin + 9.to_b,
        b_y: 0.to_b,
        b_z: @z_origin + (4.to_b * i),
        part: Slope333X4West.new,
        color: Color::RED
      )
      add_part(
        m_y: roof_base_height,
        b_x: @x_origin + 7.to_b,
        b_y: -1.to_b,
        b_z: @z_origin + (4.to_b * i),
        part: Slope333X4West.new,
        color: Color::RED
      )
    end
    0.upto(1) do |i|
      add_part(
        m_y: roof_base_height,
        b_x: @x_origin + 4.to_b,
        b_y: -2.to_b,
        b_z: @z_origin + (6.to_b * i),
        part: Slope452X6West.new,
        color: Color::RED
      )
    end
  end

  # @return [void]
  def create_roof_half_west
    0.upto(2) do |i|
      add_part(
        m_y: roof_base_height,
        b_x: @x_origin,
        b_y: 0.to_b,
        b_z: @z_origin + (4.to_b * i),
        part: Slope333X4East.new,
        color: Color::RED
      )
      add_part(
        m_y: roof_base_height,
        b_x: @x_origin + 2.to_b,
        b_y: -1.to_b,
        b_z: @z_origin + (4.to_b * i),
        part: Slope333X4East.new,
        color: Color::RED
      )
    end
    0.upto(1) do |i|
      add_part(
        m_y: roof_base_height,
        b_x: @x_origin + 4.to_b,
        b_y: -2.to_b,
        b_z: @z_origin + (6.to_b * i),
        part: Slope452X6East.new,
        color: Color::RED
      )
    end
  end
end
