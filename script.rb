require_relative 'usda/usda'
require_relative 'elements/elements'

output = File.open(File.join('out', 'out.usda'), 'w')
usda = Usda.new(output)

require_relative 'world_reader'

input = WorldReader.read_file
Material.initialize(usda)
world = World.new(input[:columns], input[:x], input[:levels], input[:map])
world.create(usda)

output.close
