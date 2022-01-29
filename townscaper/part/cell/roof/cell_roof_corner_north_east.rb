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
    with(b_y: 0.to_b,) do
      if pillar_north_east?
        add_part(
          b_x: 2.to_b,
          b_z: 0.to_b,
          part: Slope333X2North.new,
        )
        add_part(
          b_x: 0.to_b,
          b_z: 2.to_b,
          part: Slope452X1East.new,
        )
      else
        add_part(
          b_x: 0.to_b,
          b_z: 0.to_b,
          part: Slope333X3ConvexNorthEast.new,
        )
        add_part(
          b_x: 3.to_b,
          b_z: 0.to_b,
          part: Slope333X1North.new,
        )
      end
      add_part(
        b_x: 0.to_b,
        b_z: 3.to_b,
        part: Slope333X1East.new,
      )
      add_part(
        b_x: 0.to_b,
        b_z: 4.to_b,
        part: Slope333X4East.new,
      )
      add_part(
        b_x: 0.to_b,
        b_z: 8.to_b,
        part: Slope333X4East.new,
      )
      add_part(
        b_x: 4.to_b,
        b_z: 0.to_b,
        part: Slope333X4North.new,
      )

      add_part(
        b_x: 8.to_b,
        b_z: 0.to_b,
        part: Slope333X4North.new,
      )
    end
  end

  def create_roof_corner_north_east_level_1
    with(b_y: -1.to_b,) do
      if pillar_north_east?
        add_part(
          b_x: 1.to_b,
          b_z: 2.to_b,
          part: Tile1X1.new,
          b_y: -1.to_b
        )
      end
      add_part(
        b_x: 2.to_b,
        b_z: 2.to_b,
        part: Slope333X3ConvexNorthEast.new,
      )
      add_part(
        b_x: 5.to_b,
        b_z: 2.to_b,
        part: Slope333X4North.new,
      )
      add_part(
        b_x: 9.to_b,
        b_z: 2.to_b,
        part: Slope333X3North.new,
      )
      add_part(
        b_x: 2.to_b,
        b_z: 5.to_b,
        part: Slope333X4East.new,
      )
      add_part(
        b_x: 2.to_b,
        b_z: 9.to_b,
        part: Slope333X3East.new,
      )
    end
  end

  def create_roof_corner_north_east_level_2
    with(b_y: -2.to_b,) do
      add_part(
        b_x: 4.to_b,
        b_z: 4.to_b,
        part: Slope452X2ConvexNorthEast.new,
      )
      add_part(
        b_x: 6.to_b,
        b_z: 4.to_b,
        part: Slope452X2North.new,
      )
      add_part(
        b_x: 8.to_b,
        b_z: 4.to_b,
        part: Slope452X4North.new,
      )
      add_part(
        b_x: 4.to_b,
        b_z: 6.to_b,
        part: Slope452X2East.new,
      )
      add_part(
        b_x: 4.to_b,
        b_z: 8.to_b,
        part: Slope452X4East.new,
      )
    end
  end

  def create_roof_corner_north_east_level_3
    with(b_y: -3.to_b,) do
      add_part(
        b_x: 5.to_b,
        b_z: 5.to_b,
        part: Slope452X2ConvexConcaveNorthEast.new,
      )
      add_part(
        b_x: 7.to_b,
        b_z: 5.to_b,
        part: Slope452X4Z.new,
      )
      add_part(
        b_x: 11.to_b,
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
