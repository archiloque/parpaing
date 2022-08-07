module CellPillars

  private

  # @param [Usda] usda
  # @return [void]
  def create_pillars(usda)
    under = void_under
    if under.delta_z == 0
      return
    end
    usda.with(
      material: Material::WHITE,
      ) do


    unless minus_x_filled? || minus_y_filled?
      create_pillar(
        usda,
        under,
        0,
        0,
        0,
        0,
      )
    end
    unless plus_x_filled? || minus_y_filled?
      create_pillar(
        usda,
        under,
        Cell::HOUSE_WIDTH - 1,
        0,
        -1,
        0,
      )
    end
    unless minus_x_filled? || plus_y_filled?
      create_pillar(
        usda,
        under,
        0,
        Cell::HOUSE_WIDTH - 1,
        0,
        -1,
      )
    end
    unless plus_x_filled? || plus_y_filled?
      create_pillar(
        usda,
        under,
        Cell::HOUSE_WIDTH - 1,
        Cell::HOUSE_WIDTH - 1,
        -1,
        -1,
      )
    end
    end
  end

  # @param [Usda] usda
  # @param [VoidUnder] under
  # @param [Integer] x_position
  # @param [Integer] y_position
  # @param [Integer] delta_x
  # @param [Integer] delta_y
  # @return [void]
  def create_pillar(
    usda,
    under,
    x_position,
    y_position,
    delta_x,
    delta_y
  )
    pillar_height = under.delta_z * Cell::HOUSE_HEIGHT - 2
    unless under.reach_bottom
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
    usda.create_rectangular_cuboid(
      position: Usda::Coordinates.new(
        x: x_position + delta_x,
        y: y_position + delta_y,
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
        x: x_position + (2 * delta_x),
        y: y_position + (2 * delta_y),
        z: -1
      ),
      dimension: Usda::Dimension.new(
        x: 3,
        y: 3,
        z: 1
      ),
      )
  end

  # @return [VoidUnder]
  def void_under
    result = 0
    current_z = z
    delta = Delta::DELTA_MINUS_Z
    until filled?(delta) || (current_z == 0)
      result += 1
      delta += Delta::DELTA_MINUS_Z
      current_z -= 1
    end
    VoidUnder.new(
      result,
      current_z == 0
    )
  end

  class VoidUnder

    # @return [Integer]
    attr_reader :delta_z
    # @return [Boolean]
    attr_reader :reach_bottom

    # @param [Integer] delta_z
    # @param [Boolean] reach_bottom
    def initialize(delta_z, reach_bottom)
      @delta_z = delta_z
      @reach_bottom = reach_bottom
    end
  end
end
