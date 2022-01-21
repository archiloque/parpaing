require_relative 'cell_roof_half'
require_relative 'cell_roof_corner'
require_relative 'cell_roof_top'

require_relative 'cell_roof_north_south'
require_relative 'cell_roof_east_west'

require_relative 'cell_roof_corner_north_east'
require_relative 'cell_roof_corner_north_west'
require_relative 'cell_roof_corner_south_east'
require_relative 'cell_roof_corner_south_west'

require_relative 'cell_roof_triple_north'
require_relative 'cell_roof_triple_south'
require_relative 'cell_roof_triple_east'
require_relative 'cell_roof_triple_west'

require_relative 'cell_roof_quadruple'

module CellRoof
  include CellRoofHalf
  include CellRoofCorner
  include CellRoofTop

  include CellRoofNorthSouth
  include CellRoofEastWestSoon

  include CellRoofCornerNorthEast
  include CellRoofCornerNorthWest
  include CellRoofCornerSouthEast
  include CellRoofCornerSouthWest

  include CellRoofTripleNorth
  include CellRoofTripleSouth
  include CellRoofTripleEast
  include CellRoofTripleWest

  include CellRoofQuadruple

  # @return [DrawUnit]
  def roof_base_height
    @roof_base_height ||= @y_origin - ((Cell::HEIGHT_IN_BRICKS) * BRICK_HEIGHT) - PLATE_HEIGHT
  end

  def create_roof
    if north_filled? && south_filled? && east_filled? && west_filled?
      create_roof_quadruple
    elsif north_filled? && south_filled? && east_filled?
      create_roof_triple_west
    elsif north_filled? && south_filled? && west_filled?
      create_roof_triple_east
    elsif north_filled? && west_filled? && east_filled?
      create_roof_triple_south
    elsif south_filled? && west_filled? && east_filled?
      create_roof_triple_north
    elsif north_filled? && east_filled?
      create_roof_corner_south_west
    elsif north_filled? && west_filled?
      create_roof_corner_south_east
    elsif south_filled? && east_filled?
      create_roof_corner_north_west
    elsif south_filled? && west_filled?
      create_roof_corner_north_east
    elsif east_filled?
      create_roof_east_west
    elsif west_filled?
      create_roof_east_west
    else
      create_roof_north_south
    end
  end
end
