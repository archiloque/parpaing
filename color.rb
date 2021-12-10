class Color
  attr_reader :name, :code

  # @param [String] name
  # @param [Integer] code
  def initialize(name:, code:)
    @name = name
    @code = code
  end

  BLACK = Color.new(name: 'Black', code: 0)
  BLUE = Color.new(name: 'Blue', code: 1)
  BRIGHT_GREEN = Color.new(name: 'Bright Green', code: 10)
  DARK_BLUISH_GRAY = Color.new(name: 'Dark Bluish Gray', code: 72)
  DARK_TURQUOISE = Color.new(name: 'Dark Turquoise', code: 3)
  GREEN = Color.new(name: 'Green', code: 2)
  LIGHT_GRAY = Color.new(name: 'Light Gray', code: 7)
  MEDIUM_BLUE = Color.new(name: 'Medium Blue', code: 73)
  MILKY_WHITE = Color.new(name: 'Milky White', code: 79)
  PINK = Color.new(name: 'Pink', code: 13)
  RED = Color.new(name: 'Red', code: 4)
  WHITE = Color.new(name: 'White', code: 15)
  YELLOW = Color.new(name: 'Yellow', code: 14)
end
