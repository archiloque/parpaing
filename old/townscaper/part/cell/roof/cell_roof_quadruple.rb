module CellRoofQuadruple
  # @return [void]
  def create_roof_quadruple
    create_roof_north_west_corner
    create_roof_south_west_corner
    create_roof_north_east_corner
    create_roof_south_east_corner
    create_roof_top_east_west
    create_roof_top_east
    create_roof_top_west
  end
end
