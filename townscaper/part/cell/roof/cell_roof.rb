require_relative 'cell_roof_north_south'

require_relative 'cell_roof_corner_north_east'

module CellRoof
  include CellRoofNorthSouth
  include CellRoofCornerNorthEast

  # @return [DrawUnit]
  def roof_base_height
    @y_origin - ((Cell::HEIGHT_IN_BRICKS) * BRICK_HEIGHT) - PLATE_HEIGHT
  end
end
