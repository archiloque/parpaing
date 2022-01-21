module CellRoofNorthSouth

  # @return [void]
  def create_roof_north_south
    m_y = roof_base_height

    0.upto(2) do |i|
      add_part(
        m_y: m_y,
        b_x: @x_origin + (4.to_b * i),
        b_y: 0.to_b,
        b_z: @z_origin,
        part: Slope333X4North.new,
        color: Color::RED
      )
      add_part(
        m_y: m_y,
        b_x: @x_origin + (4.to_b * i),
        b_y: 0.to_b,
        b_z: @z_origin + 9.to_b,
        part: Slope333X4South.new,
        color: Color::RED
      )
      add_part(
        m_y: m_y,
        b_x: @x_origin + (4.to_b * i),
        b_y: -1.to_b,
        b_z: @z_origin + 2.to_b,
        part: Slope333X4North.new,
        color: Color::RED
      )
      add_part(
        m_y: m_y,
        b_x: @x_origin + (4.to_b * i),
        b_y: -1.to_b,
        b_z: @z_origin + 7.to_b,
        part: Slope333X4South.new,
        color: Color::RED
      )
      add_part(
        m_y: m_y,
        b_x: @x_origin + (4.to_b * i),
        b_y: -3.to_b,
        b_z: @z_origin + 5.to_b,
        part: Slope452X4Z.new,
        color: Color::RED
      )
    end
    0.upto(1) do |i|
      add_part(
        m_y: m_y,
        b_x: @x_origin + (6.to_b * i),
        b_y: -2.to_b,
        b_z: @z_origin + 4.to_b,
        part: Slope452X6North.new,
        color: Color::RED
      )
      add_part(
        m_y: m_y,
        b_x: @x_origin + (6.to_b * i),
        b_y: -2.to_b,
        b_z: @z_origin + 6.to_b,
        part: Slope452X6South.new,
        color: Color::RED
      )
    end
    add_part(
      m_y: m_y,
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin + 3.to_b,
      part: Brick1X6Z.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 11.to_b,
      b_y: 0.to_b,
      b_z: @z_origin + 3.to_b,
      part: Brick1X6Z.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin,
      b_y: -1.to_b,
      b_z: @z_origin + 5.to_b,
      part: Brick1X2Z.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 11.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 5.to_b,
      part: Brick1X2Z.new,
      color: Color::RED
    )
  end
end
