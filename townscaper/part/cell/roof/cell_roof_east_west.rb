module CellRoofEastWestSoon

  # @return [void]
  def create_roof_east_west
    create_roof_half_north
    create_roof_half_south
    create_roof_top_north_south

    add_part(
      b_x: 0.to_b,
      b_y: 0.to_b,
      b_z: 3.to_b,
      part: Brick1X6Z.new,
    )
    add_part(
      b_x: 11.to_b,
      b_y: 0.to_b,
      b_z: 3.to_b,
      part: Brick1X6Z.new,
    )
    add_part(
      b_x: 0.to_b,
      b_y: -1.to_b,
      b_z: 5.to_b,
      part: Brick1X2Z.new,
    )
    add_part(
      b_x: 11.to_b,
      b_y: -1.to_b,
      b_z: 5.to_b,
      part: Brick1X2Z.new,
    )
  end
end
