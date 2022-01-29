class Part
  attr_reader :name, :code
  # @param [String] name
  # @param [String] code
  def initialize(name, code)
    @name = name
    @code = code
  end
end

require_relative 'set_part'
require_relative 'occupier'
require_relative 'occupying_part'
require_relative 'with_parts'
require_relative 'with_walls'

require_relative 'brick'
require_relative 'plate'
require_relative 'baseplate'
require_relative 'arch'
require_relative 'slope/slope_33'
require_relative 'slope/slope_45'
require_relative 'tile'

require_relative 'cell/cell'
require_relative 'level'
require_relative 'world'
