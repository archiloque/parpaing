module CellRoofTop
  # @return [void]
  def create_roof_top_north_south
    0.upto(2) do |i|
      add_part(
        m_y: roof_base_height,
        b_x: @x_origin + (4.to_b * i),
        b_y: -3.to_b,
        b_z: @z_origin + 5.to_b,
        part: Slope452X4Z.new,
        color: Color::RED
      )
    end
  end

  # @return [void]
  def create_roof_top_east_west
    0.upto(2) do |i|
      add_part(
        m_y: roof_base_height,
        b_x: @x_origin + 5.to_b,
        b_y: -3.to_b,
        b_z: @z_origin + (4.to_b * i),
        part: Slope452X4X.new,
        color: Color::RED
      )
    end
  end

  # @return [void]
  def create_roof_top_south
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 5.to_b,
      b_y: -3.to_b,
      b_z: @z_origin + 8.to_b,
      part: Slope452X4X.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 5.to_b,
      b_y: -3.to_b,
      b_z: @z_origin + 6.to_b,
      part: Slope452X1DoubleInvertedSouth.new,
      color: Color::RED
    )
  end

  # @return [void]
  def create_roof_top_north
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 5.to_b,
      b_y: -3.to_b,
      b_z: @z_origin,
      part: Slope452X4X.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 5.to_b,
      b_y: -3.to_b,
      b_z: @z_origin + 4.to_b,
      part: Slope452X1DoubleInvertedNorth.new,
      color: Color::RED
    )
  end

  # @return [void]
  def create_roof_top_east
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin,
      b_y: -3.to_b,
      b_z: @z_origin + 5.to_b,
      part: Slope452X4Z.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 4.to_b,
      b_y: -3.to_b,
      b_z: @z_origin + 5.to_b,
      part: Slope452X1DoubleInvertedEast.new,
      color: Color::RED
    )
  end

  # @return [void]
  def create_roof_top_west
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 8.to_b,
      b_y: -3.to_b,
      b_z: @z_origin + 5.to_b,
      part: Slope452X4Z.new,
      color: Color::RED
    )
    add_part(
      m_y: roof_base_height,
      b_x: @x_origin + 7.to_b,
      b_y: -3.to_b,
      b_z: @z_origin + 5.to_b,
      part: Slope452X1DoubleInvertedWest.new,
      color: Color::RED
    )
  end
end
