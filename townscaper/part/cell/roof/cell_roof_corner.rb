module CellRoofCorner
  def create_roof_north_west_corner
    if pillar_north_west?
    else
      add_part(
        b_x: 9.to_b,
        b_y: 0.to_b,
        b_z: 0.to_b,
        part: Slope333X3ConcaveNorthWest.new,
      )
    end
    add_part(
      b_x: 7.to_b,
      b_y: -1.to_b,
      b_z: 2.to_b,
      part: Slope333X3ConcaveNorthWest.new,
    )
    add_part(
      b_x: 10.to_b,
      b_y: -1.to_b,
      b_z: 2.to_b,
      part: Slope333X2North.new,
    )
    add_part(
      b_x: 7.to_b,
      b_y: -1.to_b,
      b_z: 0.to_b,
      part: Slope333X2West.new,
    )
    add_part(
      b_x: 6.to_b,
      b_y: -2.to_b,
      b_z: 4.to_b,
      part: Slope452X2ConcaveNorthWest.new,
    )
    add_part(
      b_x: 8.to_b,
      b_y: -2.to_b,
      b_z: 4.to_b,
      part: Slope452X4North.new,
    )
    add_part(
      b_x: 6.to_b,
      b_y: -2.to_b,
      b_z: 0.to_b,
      part: Slope452X4West.new,
    )
  end

  def create_roof_north_east_corner
    if pillar_north_east?
    else
      add_part(
        b_x: 0.to_b,
        b_y: 0.to_b,
        b_z: 0.to_b,
        part: Slope333X3ConcaveNorthEast.new,
      )
    end
    add_part(
      b_x: 2.to_b,
      b_y: -1.to_b,
      b_z: 2.to_b,
      part: Slope333X3ConcaveNorthEast.new,
    )
    add_part(
      b_x: 0.to_b,
      b_y: -1.to_b,
      b_z: 2.to_b,
      part: Slope333X2North.new,
    )
    add_part(
      b_x: 2.to_b,
      b_y: -1.to_b,
      b_z: 0.to_b,
      part: Slope333X2East.new,
    )
    add_part(
      b_x: 4.to_b,
      b_y: -2.to_b,
      b_z: 4.to_b,
      part: Slope452X2ConcaveNorthEast.new,
    )
    add_part(
      b_x: 0.to_b,
      b_y: -2.to_b,
      b_z: 4.to_b,
      part: Slope452X4North.new,
    )
    add_part(
      b_x: 4.to_b,
      b_y: -2.to_b,
      b_z: 0.to_b,
      part: Slope452X4East.new,
    )
  end

  def create_roof_south_west_corner
    if pillar_south_west?
    else
      add_part(
        b_x: 9.to_b,
        b_y: 0.to_b,
        b_z: 9.to_b,
        part: Slope333X3ConcaveSouthWest.new,
      )
    end
    add_part(
      b_x: 7.to_b,
      b_y: -1.to_b,
      b_z: 7.to_b,
      part: Slope333X3ConcaveSouthWest.new,
    )
    add_part(
      b_x: 10.to_b,
      b_y: -1.to_b,
      b_z: 7.to_b,
      part: Slope333X2South.new,
    )
    add_part(
      b_x: 7.to_b,
      b_y: -1.to_b,
      b_z: 10.to_b,
      part: Slope333X2West.new,
    )
    add_part(
      b_x: 6.to_b,
      b_y: -2.to_b,
      b_z: 6.to_b,
      part: Slope452X2ConcaveSouthWest.new,
    )
    add_part(
      b_x: 8.to_b,
      b_y: -2.to_b,
      b_z: 6.to_b,
      part: Slope452X4South.new,
    )
    add_part(
      b_x: 6.to_b,
      b_y: -2.to_b,
      b_z: 8.to_b,
      part: Slope452X4West.new,
    )
  end

  def create_roof_south_east_corner
    if pillar_south_east?
    else
      add_part(
        b_x: 0.to_b,
        b_y: 0.to_b,
        b_z: 9.to_b,
        part: Slope333X3ConcaveSouthEast.new,
      )
    end
    add_part(
      b_x: 2.to_b,
      b_y: -1.to_b,
      b_z: 7.to_b,
      part: Slope333X3ConcaveSouthEast.new,
    )
    add_part(
      b_x: 2.to_b,
      b_y: -1.to_b,
      b_z: 10.to_b,
      part: Slope333X2East.new,
    )
    add_part(
      b_x: 0.to_b,
      b_y: -1.to_b,
      b_z: 7.to_b,
      part: Slope333X2South.new,
    )
    add_part(
      b_x: 0.to_b,
      b_y: -2.to_b,
      b_z: 6.to_b,
      part: Slope452X4South.new,
    )
    add_part(
      b_x: 4.to_b,
      b_y: -2.to_b,
      b_z: 6.to_b,
      part: Slope452X2ConcaveSouthEast.new,
    )
    add_part(
      b_x: 4.to_b,
      b_y: -2.to_b,
      b_z: 8.to_b,
      part: Slope452X4East.new,
    )
  end
end
