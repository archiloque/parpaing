class Unit
  include Measures
  include Occupier
  include WithResult
  include WithWalls

  UNIT_WIDTH_IN_BRICKS = 12
  UNIT_HEIGHT_IN_BRICKS = 6

  UNIT_WIDTH_IN_MEASUREMENT = (UNIT_WIDTH_IN_BRICKS * BRICK_WIDTH)
  UNIT_HEIGHT_IN_MEASUREMENT = (UNIT_HEIGHT_IN_BRICKS * BRICK_HEIGHT) + (2 * PLATE_HEIGHT)

  # @param [Integer] x_origin
  # @param [Integer] y_origin
  # @param [Integer] z_origin
  def initialize(
    x_origin:,
    y_origin:,
    z_origin:
  )
    @x_origin = x_origin
    @y_origin = y_origin
    @z_origin = z_origin
  end

  def create
    0.downto(-UNIT_HEIGHT_IN_BRICKS) do |row|
      # North wall
      create_wall_along_x(
        y: @y_origin + (row * BRICK_HEIGHT),
        x: @x_origin,
        to_x: GARAGE_WIDTH,
        z: @z_origin,
      )
    end
  end

end
