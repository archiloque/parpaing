module CellRoofEastWestSoon

  # @return [void]
  def create_roof_east_west
    create_roof_half_north
    create_roof_half_south
    create_roof_top_north_south

    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin + 3.to_b,
      part: Brick1X6Z.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 11.to_b,
      b_y: 0.to_b,
      b_z: @z_origin + 3.to_b,
      part: Brick1X6Z.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: -1.to_b,
      b_z: @z_origin + 5.to_b,
      part: Brick1X2Z.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 11.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 5.to_b,
      part: Brick1X2Z.new,
      color: Color::RED
    )
  end
end
