module CellPillars

  private

  # @param [Usda] usda
  # @return [void]
  def create_pillars(usda)
    usda.with(
      material: Material::YELLOW,
    ) do

      unless minus_x_filled? || minus_y_filled?
        create_pillar(
          usda,
          0,
          0,
          0,
          0,
          [Delta::DELTA_MINUS_X, Delta::DELTA_MINUS_Y],
        )
      end
      unless plus_x_filled? || minus_y_filled?
        create_pillar(
          usda,
          Cell::HOUSE_WIDTH - 1,
          0,
          -1,
          0,
          [Delta::DELTA_PLUS_X, Delta::DELTA_MINUS_Y],
        )
      end
      unless minus_x_filled? || plus_y_filled?
        create_pillar(
          usda,
          0,
          Cell::HOUSE_WIDTH - 1,
          0,
          -1,
          [Delta::DELTA_MINUS_X, Delta::DELTA_PLUS_Y],
        )
      end
      unless plus_x_filled? || plus_y_filled?
        create_pillar(
          usda,
          Cell::HOUSE_WIDTH - 1,
          Cell::HOUSE_WIDTH - 1,
          -1,
          -1,
          [Delta::DELTA_PLUS_X, Delta::DELTA_PLUS_Y],
        )
      end
    end
  end

  # @param [Usda] usda
  # @param [Integer] x_position
  # @param [Integer] y_position
  # @param [Integer] capital_delta_x
  # @param [Integer] capital_delta_y
  # @return [void]
  # @param [Array<Delta>] deltas_cells
  def create_pillar(
    usda,
    x_position,
    y_position,
    capital_delta_x,
    capital_delta_y,
    deltas_cells
  )
    under = void_under(deltas_cells)

    if under.delta_z != 0
      pillar_height = under.delta_z * Cell::HOUSE_HEIGHT - 2
      if under.bottom == Bottom::BOTTOM_BOTTOM_CELL
        pillar_height -= 1
      end

      usda.create_rectangular_cuboid(
        position: Usda::Coordinates.new(
          x: x_position,
          y: y_position,
          z: -pillar_height - 2
        ),
        dimension: Usda::Dimension.new(
          x: 1,
          y: 1,
          z: pillar_height
        ),
      )
    end
    if (under.delta_z != 0) || (under.bottom == Bottom::BOTTOM_LATERAL_CELL)
      usda.create_rectangular_cuboid(
        position: Usda::Coordinates.new(
          x: x_position + capital_delta_x,
          y: y_position + capital_delta_y,
          z: -2
        ),
        dimension: Usda::Dimension.new(
          x: 2,
          y: 2,
          z: 1
        ),
      )
      usda.create_rectangular_cuboid(
        position: Usda::Coordinates.new(
          x: x_position + (2 * capital_delta_x),
          y: y_position + (2 * capital_delta_y),
          z: -1
        ),
        dimension: Usda::Dimension.new(
          x: 3,
          y: 3,
          z: 1
        ),
      )
    end
  end

  # @param [Array<Delta>] deltas_cells
  # @return [VoidUnder]
  def void_under(deltas_cells)
    result = 0
    current_delta = Delta::DELTA_MINUS_Z
    while true
      if (z - result) == 0
        return VoidUnder.new(
          result,
          Bottom::BOTTOM_SEA
        )
      end
      if filled?(current_delta)
        return VoidUnder.new(
          result,
          Bottom::BOTTOM_BOTTOM_CELL
        )
      end
      deltas_cells.each do |delta_cell|
        if filled?(current_delta + delta_cell)
          return VoidUnder.new(
            result,
            Bottom::BOTTOM_LATERAL_CELL
          )
        end
      end
      result += 1
      current_delta += Delta::DELTA_MINUS_Z
    end
  end

  class Bottom
    # @return [Integer]
    attr_accessor :type

    # @param [Integer] type
    def initialize(type)
      @type = type
    end

    BOTTOM_SEA = Bottom.new(1)
    BOTTOM_BOTTOM_CELL = Bottom.new(2)
    BOTTOM_LATERAL_CELL = Bottom.new(3)
  end

  class VoidUnder
    # @return [Integer]
    attr_reader :delta_z
    # @return [Bottom]
    attr_reader :bottom

    # @param [Integer] delta_z
    # @param [Bottom] bottom
    def initialize(delta_z, bottom)
      @delta_z = delta_z
      @bottom = bottom
    end
  end
end
