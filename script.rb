require_relative 'usda/usda'

output = File.open(File.join('out', 'out.usda'), 'w')
usda = Usda.new(output)

BLUE_MATERIAL = 'Blue'
usda.create_material(BLUE_MATERIAL, Usda::Color.new(r: 30, g: 90, b: 169))
GREEN_MATERIAL = 'Green'
usda.create_material(GREEN_MATERIAL, Usda::Color.new(r: 0, g: 133, b: 43))
RED_MATERIAL = 'Red'
usda.create_material(RED_MATERIAL, Usda::Color.new(r: 180, g: 0, b: 0))
WHITE_MATERIAL = 'White'
usda.create_material(WHITE_MATERIAL, Usda::Color.new(r: 244, g: 244, b: 244))
YELLOW_MATERIAL = 'Yellow'
usda.create_material(YELLOW_MATERIAL, Usda::Color.new(r: 250, g: 200, b: 10))

COLORS = [
  BLUE_MATERIAL,
  GREEN_MATERIAL,
  RED_MATERIAL,
  WHITE_MATERIAL,
  YELLOW_MATERIAL,
]

HOUSE_COLORS = [
  BLUE_MATERIAL,
  WHITE_MATERIAL,
  YELLOW_MATERIAL,
]

def random_material
  COLORS[Kernel.rand(COLORS.length)]
end

HOUSE_WIDTH = 12
HOUSE_HEIGHT = 6

0.upto(500) do
  house_position = Usda::Coordinates.new(
    x: Kernel.rand(500),
    y: Kernel.rand(500),
    z: Kernel.rand(500),
  )

  usda.with(Usda::Context.new(
    position: house_position,
    material: HOUSE_COLORS[Kernel.rand(HOUSE_COLORS.length)]
  )) do
    usda.create_light(position: Usda::Coordinates.new(x: HOUSE_WIDTH / 2, y: HOUSE_WIDTH / 2, z: HOUSE_HEIGHT))
    0.upto(HOUSE_HEIGHT) do |level|
      unless [HOUSE_HEIGHT - 1, HOUSE_HEIGHT - 2].include?(level)
        dimension_1 = Usda::Dimension.new(x: 1, y: HOUSE_WIDTH, z: 1)
        usda.create_rectangular_cuboid(
          dimension: dimension_1,
          position: Usda::Coordinates.new(x: 0, y: 0, z: level + 1),
        )
        usda.create_rectangular_cuboid(
          dimension: dimension_1,
          position: Usda::Coordinates.new(x: HOUSE_WIDTH - 1, y: 0, z: level + 1),
        )

        dimension_2 = Usda::Dimension.new(x: HOUSE_WIDTH - 2, y: 1, z: 1)
        usda.create_rectangular_cuboid(
          dimension: dimension_2,
          position: Usda::Coordinates.new(x: 1, y: 0, z: level + 1),
        )
        usda.create_rectangular_cuboid(
          dimension: dimension_2,
          position: Usda::Coordinates.new(x: 1, y: HOUSE_WIDTH - 1, z: level + 1),
        )
      end
    end

    [HOUSE_HEIGHT - 1, HOUSE_HEIGHT - 2].each do |level|
      dimension_1 = Usda::Dimension.new(x: 1, y: (HOUSE_WIDTH / 2) - 2, z: 1)
      usda.create_rectangular_cuboid(
        dimension: dimension_1,
        position: Usda::Coordinates.new(x: 0, y: 0, z: level + 1),
      )
      usda.create_rectangular_cuboid(
        dimension: dimension_1,
        position: Usda::Coordinates.new(x: 0, y: (HOUSE_WIDTH / 2) + 2, z: level + 1),
      )

      usda.create_rectangular_cuboid(
        dimension: dimension_1,
        position: Usda::Coordinates.new(x: HOUSE_WIDTH - 1, y: 0, z: level + 1),
      )
      usda.create_rectangular_cuboid(
        dimension: dimension_1,
        position: Usda::Coordinates.new(x: HOUSE_WIDTH - 1, y: (HOUSE_WIDTH / 2) + 2, z: level + 1),
      )

      dimension_2 = Usda::Dimension.new(x: ((HOUSE_WIDTH - 2) / 2) - 2, y: 1, z: 1)
      usda.create_rectangular_cuboid(
        dimension: dimension_2,
        position: Usda::Coordinates.new(x: 1, y: 0, z: level + 1),
      )
      usda.create_rectangular_cuboid(
        dimension: dimension_2,
        position: Usda::Coordinates.new(x: 1, y: HOUSE_WIDTH - 1, z: level + 1),
      )

      usda.create_rectangular_cuboid(
        dimension: dimension_2,
        position: Usda::Coordinates.new(x: 1 + (HOUSE_WIDTH / 2) + 1, y: 0, z: level + 1),
      )
      usda.create_rectangular_cuboid(
        dimension: dimension_2,
        position: Usda::Coordinates.new(x: 1 + (HOUSE_WIDTH / 2) + 1, y: HOUSE_WIDTH - 1, z: level + 1),
      )
    end

    usda.create_rectangular_cuboid(
      material: GREEN_MATERIAL,
      dimension: Usda::Dimension.new(x: HOUSE_WIDTH + 4, y: HOUSE_WIDTH + 4, z: 1),
      position: Usda::Coordinates.new(x: -2, y: -2, z: 0),
    )

    0.upto(HOUSE_WIDTH / 2).each do |roof_level|
      width = (HOUSE_WIDTH + 2) - (roof_level * 2)
      usda.create_rectangular_cuboid(
        material: RED_MATERIAL,
        dimension: Usda::Dimension.new(x: width, y: width, z: 1),
        position: Usda::Coordinates.new(x: -1 + roof_level, y: -1 + roof_level, z: HOUSE_HEIGHT + 2 + roof_level),
      )
    end
  end
end
output.close
