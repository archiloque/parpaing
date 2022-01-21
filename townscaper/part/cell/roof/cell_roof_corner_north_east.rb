module CellRoofCornerNorthEast
  # @return [void]
  def create_roof_corner_north_east
    create_roof_corner_north_east_level_0
    create_roof_corner_north_east_level_1
    create_roof_corner_north_east_level_2
  end

  private

  def create_roof_corner_north_east_level_0
    m_y = roof_base_height
    add_part(
      m_y: m_y,
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin,
      part: Slope333X3ConvexNorthEast.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 3.to_b,
      b_y: 0.to_b,
      b_z: @z_origin,
      part: Slope333X1North.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin + 3.to_b,
      part: Slope333X1East.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin + 4.to_b,
      part: Slope333X4East.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin + 8.to_b,
      part: Slope333X4East.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 4.to_b,
      b_y: 0.to_b,
      b_z: @z_origin,
      part: Slope333X4North.new,
      color: Color::RED
    )

    add_part(
      m_y: m_y,
      b_x: @x_origin + 8.to_b,
      b_y: 0.to_b,
      b_z: @z_origin,
      part: Slope333X4North.new,
      color: Color::RED
    )

    add_part(
      m_y: m_y,
      b_x: @x_origin + 9.to_b,
      b_y: 0.to_b,
      b_z: @z_origin + 9.to_b,
      part: Slope333X3ConcaveNorthEast.new,
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
      b_x: @x_origin + 3.to_b,
      b_y: 0.to_b,
      b_z: @z_origin + 11.to_b,
      part: Brick1X6X.new,
      color: Color::RED
    )
  end


  def create_roof_corner_north_east_level_1
    m_y = roof_base_height
    add_part(
      m_y: m_y,
      b_x: @x_origin + 2.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 2.to_b,
      part: Slope333X3ConvexNorthEast.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 5.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 2.to_b,
      part: Slope333X4North.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 9.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 2.to_b,
      part: Slope333X3North.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 2.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 5.to_b,
      part: Slope333X4East.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 2.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 9.to_b,
      part: Slope333X3East.new,
      color: Color::RED
    )

    add_part(
      m_y: m_y,
      b_x: @x_origin + 7.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 7.to_b,
      part: Slope333X3ConcaveNorthEast.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 9.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 7.to_b,
      part: Slope333X2South.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 7.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 9.to_b,
      part: Slope333X2West.new,
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
    add_part(
      m_y: m_y,
      b_x: @x_origin + 5.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 11.to_b,
      part: Brick1X2X.new,
      color: Color::RED
    )
  end

  def create_roof_corner_north_east_level_2
    m_y = roof_base_height
    add_part(
      m_y: m_y,
      b_x: @x_origin + 4.to_b,
      b_y: -2.to_b,
      b_z: @z_origin+ 4.to_b,
      part: Slope452X2ConvexNorthEast.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 6.to_b,
      b_y: -2.to_b,
      b_z: @z_origin+ 4.to_b,
      part: Slope452X2North.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 8.to_b,
      b_y: -2.to_b,
      b_z: @z_origin+ 4.to_b,
      part: Slope452X4North.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 4.to_b,
      b_y: -2.to_b,
      b_z: @z_origin+ 6.to_b,
      part: Slope452X2East.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 4.to_b,
      b_y: -2.to_b,
      b_z: @z_origin+ 8.to_b,
      part: Slope452X4East.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 6.to_b,
      b_y: -2.to_b,
      b_z: @z_origin+ 6.to_b,
      part: Slope452X2ConcaveSouthWest.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 8.to_b,
      b_y: -2.to_b,
      b_z: @z_origin+ 6.to_b,
      part: Slope452X4South.new,
      color: Color::RED
    )
    add_part(
      m_y: m_y,
      b_x: @x_origin + 6.to_b,
      b_y: -2.to_b,
      b_z: @z_origin+ 8.to_b,
      part: Slope452X4West.new,
      color: Color::RED
    )
  end
end
