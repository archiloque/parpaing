module CellRoofCornerNorthWest
  # @return [void]
  def create_roof_corner_north_west
    create_roof_south_east_corner
    create_roof_corner_north_west_level_0
    create_roof_corner_north_west_level_1
    create_roof_corner_north_west_level_2
    create_roof_corner_north_west_level_3
  end

  private

  def create_roof_corner_north_west_level_0
    with(b_y: 0.to_b,) do
      if pillar_north_west?
        add_part(
          b_x: 8.to_b,
          b_z: 0.to_b,
          part: Slope333X2North.new,
        )
        add_part(
          b_x: 10.to_b,
          b_z: 2.to_b,
          part: Slope452X1West.new,
        )
      else
        add_part(
          b_x: 9.to_b,
          b_z: 0.to_b,
          part: Slope333X3ConvexNorthWest.new,
        )
        add_part(
          b_x: 8.to_b,
          b_z: 0.to_b,
          part: Slope333X1North.new,
        )
      end
      add_part(
        b_x: 9.to_b,
        b_z: 3.to_b,
        part: Slope333X1West.new,
      )
      add_part(
        b_x: 9.to_b,
        b_z: 4.to_b,
        part: Slope333X4West.new,
      )
      if pillar_south_west?
        add_part(
          b_x: 9.to_b,
          b_z: 8.to_b,
          part: Slope333X2West.new,
        )
      else
        add_part(
          b_x: 9.to_b,
          b_z: 8.to_b,
          part: Slope333X4West.new,
        )
      end
      if pillar_north_east?
        add_part(
          b_x: 2.to_b,
          b_z: 0.to_b,
          part: Slope333X2North.new,
        )
      else
        add_part(
          b_x: 0.to_b,
          b_z: 0.to_b,
          part: Slope333X4North.new,
        )
      end
      add_part(
        b_x: 4.to_b,
        b_z: 0.to_b,
        part: Slope333X4North.new,
      )
    end
  end

  def create_roof_corner_north_west_level_1
    with(b_y: -1.to_b,) do
      if pillar_north_west?
        add_part(
          b_x: 10.to_b,
          b_z: 2.to_b,
          part: Tile1X1.new,
        )
      end
      add_part(
        b_x: 7.to_b,
        b_z: 2.to_b,
        part: Slope333X3ConvexNorthWest.new,
      )
      add_part(
        b_x: 3.to_b,
        b_z: 2.to_b,
        part: Slope333X4North.new,
      )
      add_part(
        b_x: 0.to_b,
        b_z: 2.to_b,
        part: Slope333X3North.new,
      )
      add_part(
        b_x: 7.to_b,
        b_z: 5.to_b,
        part: Slope333X4West.new,
      )
      add_part(
        b_x: 7.to_b,
        b_z: 9.to_b,
        part: Slope333X3West.new,
      )
    end
  end

  def create_roof_corner_north_west_level_2
    with(b_y: -2.to_b,) do
      add_part(
        b_x: 6.to_b,
        b_z: 3.to_b,
        part: Slope452X2ConvexNorthWest.new,
      )
      add_part(
        b_x: 4.to_b,
        b_z: 4.to_b,
        part: Slope452X2North.new,
      )
      add_part(
        b_x: 0.to_b,
        b_z: 4.to_b,
        part: Slope452X4North.new,
      )
      add_part(
        b_x: 6.to_b,
        b_z: 5.to_b,
        part: Slope452X2West.new,
      )
      add_part(
        b_x: 6.to_b,
        b_z: 8.to_b,
        part: Slope452X4West.new,
      )
    end
  end

  def create_roof_corner_north_west_level_3
    with(b_y: -3.to_b,) do
      add_part(
        b_x: 5.to_b,
        b_z: 5.to_b,
        part: Slope452X2ConvexConcaveNorthWest.new,
      )
      add_part(
        b_x: 1.to_b,
        b_z: 5.to_b,
        part: Slope452X4Z.new,
      )
      add_part(
        b_x: 0.to_b,
        b_z: 5.to_b,
        part: Slope452X1Z.new,
      )
      add_part(
        b_x: 5.to_b,
        b_z: 7.to_b,
        part: Slope452X4X.new,
      )
      add_part(
        b_x: 5.to_b,
        b_z: 11.to_b,
        part: Slope452X1X.new,
      )
    end
  end
end
