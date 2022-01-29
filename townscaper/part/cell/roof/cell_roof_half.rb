module CellRoofHalf

  # @return [void]
  def create_roof_half_north
    if pillar_north_east?
      add_part(
        b_x: 2.to_b,
        b_y: 0.to_b,
        b_z: 0.to_b,
        part: Slope333X2North.new,
      )
      add_part(
        b_x: 0.to_b,
        b_y: 0.to_b,
        b_z: 2.to_b,
        part: Brick1X1.new,
        )
    else
      add_part(
        b_x: 0.to_b,
        b_y: 0.to_b,
        b_z: 0.to_b,
        part: Slope333X4North.new,
      )
    end
    add_part(
      b_x: 4.to_b,
      b_y: 0.to_b,
      b_z: 0.to_b,
      part: Slope333X4North.new,
    )
    add_part(
      b_x: 8.to_b,
      b_y: 0.to_b,
      b_z: 0.to_b,
      part: Slope333X4North.new,
    )
    0.upto(2) do |i|
      add_part(
        b_x: (4.to_b * i),
        b_y: -1.to_b,
        b_z: 2.to_b,
        part: Slope333X4North.new,
      )
    end
    0.upto(1) do |i|
      add_part(
        b_x: (6.to_b * i),
        b_y: -2.to_b,
        b_z: 4.to_b,
        part: Slope452X6North.new,
      )
    end
  end

  # @return [void]
  def create_roof_half_south
    0.upto(2) do |i|
      add_part(
        b_x: (4.to_b * i),
        b_y: 0.to_b,
        b_z: 9.to_b,
        part: Slope333X4South.new,
      )
      add_part(
        b_x: (4.to_b * i),
        b_y: -1.to_b,
        b_z: 7.to_b,
        part: Slope333X4South.new,
      )
    end
    0.upto(1) do |i|
      add_part(
        b_x: (6.to_b * i),
        b_y: -2.to_b,
        b_z: 6.to_b,
        part: Slope452X6South.new,
      )
    end
  end

  # @return [void]
  def create_roof_half_east
    0.upto(2) do |i|
      add_part(
        b_x: 9.to_b,
        b_y: 0.to_b,
        b_z: (4.to_b * i),
        part: Slope333X4West.new,
      )
      add_part(
        b_x: 7.to_b,
        b_y: -1.to_b,
        b_z: (4.to_b * i),
        part: Slope333X4West.new,
      )
    end
    0.upto(1) do |i|
      add_part(
        b_x: 4.to_b,
        b_y: -2.to_b,
        b_z: (6.to_b * i),
        part: Slope452X6West.new,
      )
    end
  end

  # @return [void]
  def create_roof_half_west
    if pillar_north_east?
      add_part(
        b_x: 0.to_b,
        b_y: 0.to_b,
        b_z: 2.to_b,
        part: Slope333X2East.new,
      )
      add_part(
        b_x: 2.to_b,
        b_y: 0.to_b,
        b_z: 0.to_b,
        part: Brick1X1.new,
      )
    else
      add_part(
        b_x: 0.to_b,
        b_y: 0.to_b,
        b_z: 0.to_b,
        part: Slope333X4East.new,
      )
    end
    add_part(
      b_x: 0.to_b,
      b_y: 0.to_b,
      b_z: 4.to_b,
      part: Slope333X4East.new,
    )
    add_part(
      b_x: 0.to_b,
      b_y: 0.to_b,
      b_z: 8.to_b,
      part: Slope333X4East.new,
    )
    0.upto(2) do |i|
      add_part(
        b_x: 2.to_b,
        b_y: -1.to_b,
        b_z: (4.to_b * i),
        part: Slope333X4East.new,
      )
    end
    0.upto(1) do |i|
      add_part(
        b_x: 4.to_b,
        b_y: -2.to_b,
        b_z: (6.to_b * i),
        part: Slope452X6East.new,
      )
    end
  end
end
