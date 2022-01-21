module CellRoofTripleSouth
  # @return [void]
  def create_roof_triple_south
    create_roof_half_south
    create_roof_north_west_corner
    create_roof_north_east_corner
    create_roof_top_north_south
    create_roof_top_north
  end
end
