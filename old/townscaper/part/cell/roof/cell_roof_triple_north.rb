module CellRoofTripleNorth
  # @return [void]
  def create_roof_triple_north
    create_roof_half_north
    create_roof_south_west_corner
    create_roof_south_east_corner
    create_roof_top_north_south
    create_roof_top_south
  end
end
