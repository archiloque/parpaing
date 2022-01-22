module CellRoofTop
  # @return [void]
  def create_roof_top_north_south
    0.upto(2) do |i|
      add_part(
        b_x: (4.to_b * i),
        b_y: -3.to_b,
        b_z: 5.to_b,
        part: Slope452X4Z.new,
      )
    end
  end

  # @return [void]
  def create_roof_top_east_west
    0.upto(2) do |i|
      add_part(
        b_x: 5.to_b,
        b_y: -3.to_b,
        b_z: (4.to_b * i),
        part: Slope452X4X.new,
      )
    end
  end

  # @return [void]
  def create_roof_top_south
    add_part(
      b_x: 5.to_b,
      b_y: -3.to_b,
      b_z: 8.to_b,
      part: Slope452X4X.new,
    )
    add_part(
      b_x: 5.to_b,
      b_y: -3.to_b,
      b_z: 6.to_b,
      part: Slope452X1DoubleInvertedSouth.new,
    )
  end

  # @return [void]
  def create_roof_top_north
    add_part(
      b_x: 5.to_b,
      b_y: -3.to_b,
      b_z: 0.to_b,
      part: Slope452X4X.new,
    )
    add_part(
      b_x: 5.to_b,
      b_y: -3.to_b,
      b_z: 4.to_b,
      part: Slope452X1DoubleInvertedNorth.new,
    )
  end

  # @return [void]
  def create_roof_top_east
    add_part(
      b_x: 0.to_b,
      b_y: -3.to_b,
      b_z: 5.to_b,
      part: Slope452X4Z.new,
    )
    add_part(
      b_x: 4.to_b,
      b_y: -3.to_b,
      b_z: 5.to_b,
      part: Slope452X1DoubleInvertedEast.new,
    )
  end

  # @return [void]
  def create_roof_top_west
    add_part(
      b_x: 8.to_b,
      b_y: -3.to_b,
      b_z: 5.to_b,
      part: Slope452X4Z.new,
    )
    add_part(
      b_x: 7.to_b,
      b_y: -3.to_b,
      b_z: 5.to_b,
      part: Slope452X1DoubleInvertedWest.new,
    )
  end
end
