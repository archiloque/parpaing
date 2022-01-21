module CellRoofCornerNorthEast
  # @return [void]
  def create_roof_corner_north_east
    create_roof_south_west_corner
    create_roof_corner_north_east_level_0
    create_roof_corner_north_east_level_1
    create_roof_corner_north_east_level_2
    create_roof_corner_north_east_level_3
  end

  private

  def create_roof_corner_north_east_level_0
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin,
      part: Slope333X3ConvexNorthEast.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 3.to_b,
      b_y: 0.to_b,
      b_z: @z_origin,
      part: Slope333X1North.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin + 3.to_b,
      part: Slope333X1East.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin + 4.to_b,
      part: Slope333X4East.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin + 8.to_b,
      part: Slope333X4East.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 4.to_b,
      b_y: 0.to_b,
      b_z: @z_origin,
      part: Slope333X4North.new,
      color: Color::RED
    )

    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 8.to_b,
      b_y: 0.to_b,
      b_z: @z_origin,
      part: Slope333X4North.new,
      color: Color::RED
    )
  end

  def create_roof_corner_north_east_level_1
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 2.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 2.to_b,
      part: Slope333X3ConvexNorthEast.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 5.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 2.to_b,
      part: Slope333X4North.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 9.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 2.to_b,
      part: Slope333X3North.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 2.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 5.to_b,
      part: Slope333X4East.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 2.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 9.to_b,
      part: Slope333X3East.new,
      color: Color::RED
    )
  end

  def create_roof_corner_north_east_level_2
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 4.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 4.to_b,
      part: Slope452X2ConvexNorthEast.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 6.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 4.to_b,
      part: Slope452X2North.new,
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
      b_x: @x_origin + 4.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 6.to_b,
      part: Slope452X2East.new,
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

  def create_roof_corner_north_east_level_3
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 5.to_b,
      b_y: -3.to_b,
      b_z: @z_origin + 5.to_b,
      part: Slope452X2ConvexConcaveNorthEast.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 7.to_b,
      b_y: -3.to_b,
      b_z: @z_origin + 5.to_b,
      part: Slope452X4Z.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 11.to_b,
      b_y: -3.to_b,
      b_z: @z_origin + 5.to_b,
      part: Slope452X1Z.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 5.to_b,
      b_y: -3.to_b,
      b_z: @z_origin + 7.to_b,
      part: Slope452X4X.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 5.to_b,
      b_y: -3.to_b,
      b_z: @z_origin + 11.to_b,
      part: Slope452X1X.new,
      color: Color::RED
    )
  end
end
