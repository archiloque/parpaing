class Part
  attr_reader :name, :code
  # @param [String] name
  # @param [String] code
  def initialize(name, code)
    @name = name
    @code = code
  end
end

require_relative 'measures'
require_relative 'set_part'
require_relative 'occupier'
require_relative 'with_result'

require_relative 'brick'
require_relative 'baseplate'
require_relative 'door'
require_relative 'fence'
require_relative 'house'
require_relative 'houses_block'
require_relative 'lamp_post'
require_relative 'mailbox'
require_relative 'plants'
require_relative 'plate'
require_relative 'trash_can'
require_relative 'windows/windows'
