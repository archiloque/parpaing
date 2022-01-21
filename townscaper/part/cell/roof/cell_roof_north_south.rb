module CellRoofNorthSouth
  # @return [void]
  def create_roof_north_south
    create_roof_half_east
    create_roof_half_west
    create_roof_top_east_west

    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 3.to_b,
      b_y: 0.to_b,
      b_z: @z_origin,
      part: Brick1X6X.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 3.to_b,
      b_y: 0.to_b,
      b_z: @z_origin + 11.to_b,
      part: Brick1X6X.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 5.to_b,
      b_y: -1.to_b,
      b_z: @z_origin,
      part: Brick1X2X.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 5.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 11.to_b,
      part: Brick1X2X.new,
      color: Color::RED
    )
  end
end
