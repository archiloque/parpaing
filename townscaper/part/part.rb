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
require_relative 'with_result'
require_relative 'with_walls'

require_relative 'brick'
require_relative 'plate'
require_relative 'baseplate'
require_relative 'arch'
require_relative 'cell'
require_relative 'level'
