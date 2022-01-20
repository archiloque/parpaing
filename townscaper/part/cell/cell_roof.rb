module CellRoof
  def create_roof_z
    m_y = @y_origin - ((Cell::HEIGHT_IN_BRICKS) * BRICK_HEIGHT) - PLATE_HEIGHT

    0.upto(5) do |i|
      add_part(
        m_y: m_y,
        b_x: @x_origin + (2.to_b * i),
        b_y: 0.to_b,
        b_z: @z_origin,
        part: Slope184X2North.new,
        color: Color::RED
      )
      add_part(
        m_y: m_y,
        b_x: @x_origin + (2.to_b * i),
        b_y: 0.to_b,
        b_z: @z_origin + 9.to_b,
        part: Slope184X2South.new,
        color: Color::RED
      )
    end
    0.upto(2) do |i|
      add_part(
        m_y: m_y,
        b_x: @x_origin + (4.to_b * i),
        b_y: -1.to_b,
        b_z: @z_origin + 3.to_b,
        part: Slope333X4North.new,
        color: Color::RED
      )
      add_part(
        m_y: m_y,
        b_x: @x_origin + (4.to_b * i),
        b_y: -1.to_b,
        b_z: @z_origin + 6.to_b,
        part: Slope333X4South.new,
        color: Color::RED
      )

      add_part(
        m_y: m_y,
        b_x: @x_origin + (4.to_b * i),
        b_y: -2.to_b,
        b_z: @z_origin + 5.to_b,
        part: Slope452X4Z.new,
        color: Color::RED
      )
    end
    add_part(
      m_y: m_y,
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin + 4.to_b,
      part: Brick1X4Z.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 11.to_b,
      b_y: 0.to_b,
      b_z: @z_origin + 4.to_b,
      part: Brick1X4Z.new,
      color: Color::RED
    )
  end

end
