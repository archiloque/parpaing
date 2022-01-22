module CellRoofCorner

  def create_roof_north_west_corner
    add_part(
      b_x: @x_origin + 9.to_b,
      b_y: 0.to_b,
      b_z: @z_origin,
      part: Slope333X3ConcaveNorthWest.new,
    )
    add_part(
      b_x: @x_origin + 7.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 2.to_b,
      part: Slope333X3ConcaveNorthWest.new,
    )
    add_part(
      b_x: @x_origin + 10.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 2.to_b,
      part: Slope333X2North.new,
    )
    add_part(
      b_x: @x_origin + 7.to_b,
      b_y: -1.to_b,
      b_z: @z_origin,
      part: Slope333X2West.new,
    )
    add_part(
      b_x: @x_origin + 6.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 4.to_b,
      part: Slope452X2ConcaveNorthWest.new,
    )
    add_part(
      b_x: @x_origin + 8.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 4.to_b,
      part: Slope452X4North.new,
    )
    add_part(
      b_x: @x_origin + 6.to_b,
      b_y: -2.to_b,
      b_z: @z_origin,
      part: Slope452X4West.new,
    )
  end

  def create_roof_north_east_corner
    add_part(
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin,
      part: Slope333X3ConcaveNorthEast.new,
    )
    add_part(
      b_x: @x_origin + 2.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 2.to_b,
      part: Slope333X3ConcaveNorthEast.new,
    )
    add_part(
      b_x: @x_origin,
      b_y: -1.to_b,
      b_z: @z_origin + 2.to_b,
      part: Slope333X2North.new,
    )
    add_part(
      b_x: @x_origin + 2.to_b,
      b_y: -1.to_b,
      b_z: @z_origin,
      part: Slope333X2East.new,
    )
    add_part(
      b_x: @x_origin + 4.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 4.to_b,
      part: Slope452X2ConcaveNorthEast.new,
    )
    add_part(
      b_x: @x_origin,
      b_y: -2.to_b,
      b_z: @z_origin + 4.to_b,
      part: Slope452X4North.new,
    )
    add_part(
      b_x: @x_origin + 4.to_b,
      b_y: -2.to_b,
      b_z: @z_origin,
      part: Slope452X4East.new,
    )
  end

  def create_roof_south_west_corner
    add_part(
      b_x: @x_origin + 9.to_b,
      b_y: 0.to_b,
      b_z: @z_origin + 9.to_b,
      part: Slope333X3ConcaveSouthWest.new,
    )
    add_part(
      b_x: @x_origin + 7.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 7.to_b,
      part: Slope333X3ConcaveSouthWest.new,
    )
    add_part(
      b_x: @x_origin + 10.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 7.to_b,
      part: Slope333X2South.new,
    )
    add_part(
      b_x: @x_origin + 7.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 10.to_b,
      part: Slope333X2West.new,
    )
    add_part(
      b_x: @x_origin + 6.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 6.to_b,
      part: Slope452X2ConcaveSouthWest.new,
    )
    add_part(
      b_x: @x_origin + 8.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 6.to_b,
      part: Slope452X4South.new,
    )
    add_part(
      b_x: @x_origin + 6.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 8.to_b,
      part: Slope452X4West.new,
    )
  end

  def create_roof_south_east_corner
    add_part(
      b_x: @x_origin,
      b_y: 0.to_b,
      b_z: @z_origin + 9.to_b,
      part: Slope333X3ConcaveSouthEast.new,
    )
    add_part(
      b_x: @x_origin + 2.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 7.to_b,
      part: Slope333X3ConcaveSouthEast.new,
    )
    add_part(
      b_x: @x_origin + 2.to_b,
      b_y: -1.to_b,
      b_z: @z_origin + 10.to_b,
      part: Slope333X2East.new,
    )
    add_part(
      b_x: @x_origin,
      b_y: -1.to_b,
      b_z: @z_origin + 7.to_b,
      part: Slope333X2South.new,
    )
    add_part(
      b_x: @x_origin + 0.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 6.to_b,
      part: Slope452X4South.new,
    )
    add_part(
      b_x: @x_origin + 4.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 6.to_b,
      part: Slope452X2ConcaveSouthEast.new,
    )
    add_part(
      b_x: @x_origin + 4.to_b,
      b_y: -2.to_b,
      b_z: @z_origin + 8.to_b,
      part: Slope452X4East.new,
    )
  end
end
