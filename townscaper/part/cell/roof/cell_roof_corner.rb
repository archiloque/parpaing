module CellRoofCorner

  def create_roof_north_west_corner
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 9.to_b,
      b_y: 0.to_b,
      b_z: @z_origin,
      part: Slope333X3ConcaveNorthWest.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 7.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 2.to_b,
      part: Slope333X3ConcaveNorthWest.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 10.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 2.to_b,
      part: Slope333X2North.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 7.to_b,
      b_y: -1.to_b,
      b_z: @z_origin,
      part: Slope333X2West.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 6.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 4.to_b,
      part: Slope452X2ConcaveNorthWest.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 8.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 4.to_b,
      part: Slope452X4North.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 6.to_b,
      b_y: -2.to_b,
      b_z: @z_origin,
      part: Slope452X4West.new,
      color: Color::RED
    )
  end

  def create_roof_north_east_corner
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin,
      part: Slope333X3ConcaveNorthEast.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 2.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 2.to_b,
      part: Slope333X3ConcaveNorthEast.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: -1.to_b,
      b_z: @z_origin + 2.to_b,
      part: Slope333X2North.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 2.to_b,
      b_y: -1.to_b,
      b_z: @z_origin,
      part: Slope333X2East.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 4.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 4.to_b,
      part: Slope452X2ConcaveNorthEast.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: -2.to_b,
      b_z: @z_origin + 4.to_b,
      part: Slope452X4North.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 4.to_b,
      b_y: -2.to_b,
      b_z: @z_origin,
      part: Slope452X4East.new,
      color: Color::RED
    )
  end

  def create_roof_south_west_corner
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 9.to_b,
      b_y: 0.to_b,
      b_z: @z_origin + 9.to_b,
      part: Slope333X3ConcaveSouthWest.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 7.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 7.to_b,
      part: Slope333X3ConcaveSouthWest.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 10.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 7.to_b,
      part: Slope333X2South.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 7.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 10.to_b,
      part: Slope333X2West.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 6.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 6.to_b,
      part: Slope452X2ConcaveSouthWest.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 8.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 6.to_b,
      part: Slope452X4South.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 6.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 8.to_b,
      part: Slope452X4West.new,
      color: Color::RED
    )
  end

  def create_roof_south_east_corner
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin + 9.to_b,
      part: Slope333X3ConcaveSouthEast.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 2.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 7.to_b,
      part: Slope333X3ConcaveSouthEast.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 2.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 10.to_b,
      part: Slope333X2East.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: -1.to_b,
      b_z: @z_origin + 7.to_b,
      part: Slope333X2South.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 0.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 6.to_b,
      part: Slope452X4South.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 4.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 6.to_b,
      part: Slope452X2ConcaveSouthEast.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 4.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 8.to_b,
      part: Slope452X4East.new,
      color: Color::RED
    )
  end
end
