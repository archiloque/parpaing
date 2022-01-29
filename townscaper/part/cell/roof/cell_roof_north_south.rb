module CellRoofNorthSouth
  # @return [void]
  def create_roof_north_south
    create_roof_half_west
    create_roof_half_east
    create_roof_top_east_west

    add_part(
      b_x: 3.to_b,
      b_y: 0.to_b,
      b_z: 0.to_b,
      part: Brick1X6X.new,
    )
    add_part(
      b_x: 3.to_b,
      b_y: 0.to_b,
      b_z: 11.to_b,
      part: Brick1X6X.new,
    )
    add_part(
      b_x: 5.to_b,
      b_y: -1.to_b,
      b_z: 0.to_b,
      part: Brick1X2X.new,
    )
    add_part(
      b_x: 5.to_b,
      b_y: -1.to_b,
      b_z: 11.to_b,
      part: Brick1X2X.new,
    )
  end
end
