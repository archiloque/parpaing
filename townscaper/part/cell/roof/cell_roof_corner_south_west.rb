module CellRoofCornerSouthWest
  # @return [void]
  def create_roof_corner_south_west
    create_roof_north_east_corner
    create_roof_corner_south_west_level_0
    create_roof_corner_south_west_level_1
    create_roof_corner_south_west_level_2
    create_roof_corner_south_west_level_3
  end

  private

  def create_roof_corner_south_west_level_0
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 9.to_b,
      b_y: 0.to_b,
      b_z: @z_origin + 9.to_b,
      part: Slope333X3ConvexSouthWest.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 8.to_b,
      b_y: 0.to_b,
      b_z: @z_origin + 9.to_b,
      part: Slope333X1South.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 9.to_b,
      b_y: 0.to_b,
      b_z: @z_origin + 8.to_b,
      part: Slope333X1West.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 9.to_b,
      b_y: 0.to_b,
      b_z: @z_origin + 4.to_b,
      part: Slope333X4West.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 9.to_b,
      b_y: 0.to_b,
      b_z: @z_origin,
      part: Slope333X4West.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 4.to_b,
      b_y: 0.to_b,
      b_z: @z_origin + 9.to_b,
      part: Slope333X4South.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin + 9.to_b,
      part: Slope333X4South.new,
      color: Color::RED
    )
  end

  def create_roof_corner_south_west_level_1
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 7.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 7.to_b,
      part: Slope333X3ConvexSouthWest.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 3.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 7.to_b,
      part: Slope333X4South.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: -1.to_b,
      b_z: @z_origin + 7.to_b,
      part: Slope333X3South.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 7.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 3.to_b,
      part: Slope333X4West.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 7.to_b,
      b_y: -1.to_b,
      b_z: @z_origin,
      part: Slope333X3West.new,
      color: Color::RED
    )
  end

  def create_roof_corner_south_west_level_2
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 6.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 6.to_b,
      part: Slope452X2ConvexSouthWest.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 4.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 6.to_b,
      part: Slope452X2South.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: -2.to_b,
      b_z: @z_origin + 6.to_b,
      part: Slope452X4South.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 6.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 3.to_b,
      part: Slope452X2West.new,
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

  def create_roof_corner_south_west_level_3
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 5.to_b,
      b_y: -3.to_b,
      b_z: @z_origin + 5.to_b,
      part: Slope452X2ConvexConcaveSouthWest.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 1.to_b,
      b_y: -3.to_b,
      b_z: @z_origin + 5.to_b,
      part: Slope452X4Z.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: -3.to_b,
      b_z: @z_origin + 5.to_b,
      part: Slope452X1Z.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 5.to_b,
      b_y: -3.to_b,
      b_z: @z_origin + 1.to_b,
      part: Slope452X4X.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 5.to_b,
      b_y: -3.to_b,
      b_z: @z_origin,
      part: Slope452X1X.new,
      color: Color::RED
    )
  end
end
