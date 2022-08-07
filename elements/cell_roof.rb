module CellRoof

  private

  # @param [USDA] usda
  # @return [void]
  def create_roof(usda)
    unless plus_z_filled?
      usda.with(
        material: Material::RED,
      ) do
        create_roof_single(usda)
        if minus_x_filled?
          create_roof_part_minus_x(usda)
        end
        if plus_x_filled?
          create_roof_part_plus_x(usda)
        end
        if minus_y_filled?
          create_roof_part_minus_y(usda)
        end
        if plus_y_filled?
          create_roof_part_plus_y(usda)
        end
      end
    end
  end

  # @param [USDA] usda
  # @return [void]
  def create_roof_part_minus_x(usda)
    1.upto((Cell::HOUSE_WIDTH / 2) - 1).each do |roof_level|
      usda.create_rectangular_cuboid(
        dimension: Usda::Dimension.new(x: roof_level, y: roof_width(roof_level), z: 1),
        position: Usda::Coordinates.new(x: 0, y: roof_level, z: 7 + roof_level)
      )
    end
  end

  def create_roof_part_plus_x(usda)
    1.upto((Cell::HOUSE_WIDTH / 2) - 1).each do |roof_level|
      usda.create_rectangular_cuboid(
        dimension: Usda::Dimension.new(x: roof_level, y: roof_width(roof_level), z: 1),
        position: Usda::Coordinates.new(x: Cell::HOUSE_WIDTH - roof_level, y: roof_level, z: 7 + roof_level)
      )
    end
  end

  # @param [USDA] usda
  # @return [void]
  def create_roof_part_minus_y(usda)
    1.upto((Cell::HOUSE_WIDTH / 2) - 1).each do |roof_level|
      usda.create_rectangular_cuboid(
        dimension: Usda::Dimension.new(x: roof_width(roof_level), y: roof_level, z: 1),
        position: Usda::Coordinates.new(x: roof_level, y: 0, z: 7 + roof_level)
      )
    end
  end

  def create_roof_part_plus_y(usda)
    1.upto((Cell::HOUSE_WIDTH / 2) - 1).each do |roof_level|
      usda.create_rectangular_cuboid(
        dimension: Usda::Dimension.new(x: roof_width(roof_level), y: roof_level, z: 1),
        position: Usda::Coordinates.new(x: roof_level, y: Cell::HOUSE_WIDTH - roof_level, z: 7 + roof_level)
      )
    end
  end

  # @param [USDA] usda
  # @return [void]
  def create_roof_single(usda)
    0.upto((Cell::HOUSE_WIDTH / 2) - 1).each do |roof_level|
      usda.create_rectangular_cuboid(
        dimension: Usda::Dimension.new(x: roof_width(roof_level), y: roof_width(roof_level), z: 1),
        position: Usda::Coordinates.new(x: roof_level, y: roof_level, z: 7 + roof_level)
      )
    end
  end

  # @param [Integer] roof_level
  # @return [Integer]
  def roof_width(roof_level)
    Cell::HOUSE_WIDTH - (roof_level * 2)
  end
end
