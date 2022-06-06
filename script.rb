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

0.upto(20) do |x_index|
  0.upto(20) do |y_index|
    material = COLORS[Kernel.rand(COLORS.length)]
    house_x = x_index * 6
    house_y = y_index * 6
    usda.create_rectangular_cuboid(
      material: material,
      dimension: Usda::Dimension.new(x: 3, y: 3, z: 1),
      position: Usda::Coordinates.new(x: house_x, y: house_y, z: 0),
    )
    usda.create_rectangular_cuboid(
      material: material,
      dimension: Usda::Dimension.new(x: 3, y: 3, z: 1),
      position: Usda::Coordinates.new(x: house_x, y: house_y, z: 2),
    )

    usda.create_rectangular_cuboid(
      material: material,
      dimension: Usda::Dimension.new(x: 1, y: 1, z: 1),
      position: Usda::Coordinates.new(x: house_x, y: house_y, z: 1),
    )
    usda.create_rectangular_cuboid(
      material: material,
      dimension: Usda::Dimension.new(x: 1, y: 1, z: 1),
      position: Usda::Coordinates.new(x: house_x, y: house_y + 2, z: 1),
    )
    usda.create_rectangular_cuboid(
      material: material,
      dimension: Usda::Dimension.new(x: 1, y: 1, z: 1),
      position: Usda::Coordinates.new(x: house_x + 2, y: house_y, z: 1),
    )
    usda.create_rectangular_cuboid(
      material: material,
      dimension: Usda::Dimension.new(x: 1, y: 1, z: 1),
      position: Usda::Coordinates.new(x: house_x + 2, y: house_y + 2, z: 1),
    )

    if Kernel.rand() > 0.5
      usda.create_light(
        position: Usda::Coordinates.new(x: house_x + 1.5, y: house_y + 1.5, z: 1.5),
      )
    end
  end
end

output.close
