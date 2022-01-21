module CellRoofTripleWest
  # @return [void]
  def create_roof_triple_west
    create_roof_half_east
    create_roof_north_east_corner
    create_roof_south_east_corner
    create_roof_top_east_west
    create_roof_top_east
  end
end
