class Color
  attr_reader :name, :code

  # @param [String] name
  # @param [Integer] code
  def initialize(name:, code:)
    @name = name
    @code = code
  end

  BLUE = Color.new(name: 'Blue', code: 1)
  GREEN = Color.new(name: 'Green', code: 2)
  DARK_TURQUOISE = Color.new(name: 'Dark Turquoise', code: 3)
  RED = Color.new(name: 'Red', code: 4)
  LIGHT_GRAY = Color.new(name: 'Light Gray', code: 7)
  BRIGHT_GREEN = Color.new(name: 'Bright Green', code: 10)
  YELLOW = Color.new(name: 'Yellow', code: 14)
  WHITE = Color.new(name: 'White', code: 15)
  DARK_BLUISH_GRAY = Color.new(name: 'Dark Bluish Gray', code: 72)

end
