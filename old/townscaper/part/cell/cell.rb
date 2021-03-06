require_relative 'delta'
require_relative 'basement_cell'
require_relative 'cell_positions'
require_relative 'cell_pillars'
require_relative 'cell_walls'
require_relative 'roof/cell_roof'

class Cell
  include Occupier
  include WithParts
  include WithWalls
  include BasementCell
  include CellWalls
  include CellPositions
  include CellPillars
  include CellRoof

  WIDTH_IN_BRICKS = 12.to_b
  HEIGHT_IN_BRICKS = 6.to_b

  WIDTH_IN_UNIT = WIDTH_IN_BRICKS * Measures::BRICK_WIDTH
  HEIGHT_IN_UNIT = (HEIGHT_IN_BRICKS * Measures::BRICK_HEIGHT) + (Measures::PLATE_HEIGHT)

  # @return [Level]
  attr_reader :level

  # @return [Integer]
  attr_reader :x_index

  # @return [Integer]
  attr_reader :z_index

  # @return [DrawUnit]
  attr_reader :x_origin

  # @return [DrawUnit]
  attr_reader :y_origin

  # @return [DrawUnit]
  attr_reader :z_origin

  # @param [Integer] x_index
  # @param [Integer] z_index
  # @param [DrawUnit] y_origin
  # @param [Level] level
  def initialize(
    x_index:,
    y_origin:,
    z_index:,
    level:
  )
    @x_index = x_index
    @y_origin = y_origin
    @z_index = z_index
    @level = level

    @x_origin = -WIDTH_IN_BRICKS * @x_index
    @z_origin = WIDTH_IN_BRICKS * @z_index
    initialize_pillars
  end

  # @param [IO] output
  # @return [void]
  def create(output)
    with(output: output) do
      if level.index == 0
        create_basement
        unless up_filled?
          create_floor(-152.to_u)
          create_pillars_above
          create_fences
        end
      else
        create_walls
        create_floor(0.to_u)
        unless up_filled?
          create_roof
          create_pillars_above
        end
        create_pillars_under
      end
    end
  end

  def to_s
    "Cell x: #{x_index}, z: #{z_index}, level: #{level.index}"
  end

  private

  # @param [DrawUnit] m_y
  # @return [void]
  def create_floor(m_y)
    elements = SetPart.calculate_fit(WIDTH_IN_BRICKS, Plate::BY_SIZE)
    current_x = 0.to_b
    elements.each do |element|
      part = element.part_class.new
      add_part(
        m_y: m_y,
        b_x: current_x,
        b_y: 0.to_b,
        b_z: 0.to_b,
        part: part,
        color: Color::YELLOW
      )
      current_x += element.size
    end
  end

  # @return [void]
  def create_fences
    with(
      color: Color::BRIGHT_GREEN,
      m_y: -160.to_u,
    ) do
      if (!north_filled?) && (!filled?(Delta::DELTA_NORTH + Delta::DELTA_UP))
        # North palissade
        create_fence_along_x(
          b_y: -1.to_b,
          b_z: 0.to_b,
          b_from_x: 0.to_b,
          b_to_x: 12.to_b,
        )
        create_fence_along_x(
          b_y: -2.to_b,
          b_z: 0.to_b,
          b_from_x: 0.to_b,
          b_to_x: 12.to_b,
        )
      end
      if (!south_filled?) && (!filled?(Delta::DELTA_SOUTH + Delta::DELTA_UP))
        # South palissade
        create_fence_along_x(
          b_y: -1.to_b,
          b_z: 11.to_b,
          b_from_x: 0.to_b,
          b_to_x: 12.to_b,
        )
        create_fence_along_x(
          b_y: -2.to_b,
          b_z: 11.to_b,
          b_from_x: 0.to_b,
          b_to_x: 12.to_b,
        )
      end
      if (!east_filled?) && (!filled?(Delta::DELTA_EAST + Delta::DELTA_UP))
        # East palissade
        create_fence_along_z(
          b_y: -1.to_b,
          b_x: 0.to_b,
          b_from_z: 0.to_b,
          b_to_z: 12.to_b,
        )
        create_fence_along_z(
          b_y: -2.to_b,
          b_x: 0.to_b,
          b_from_z: 0.to_b,
          b_to_z: 12.to_b,
        )
      end
      if (!west_filled?) && (!filled?(Delta::DELTA_WEST + Delta::DELTA_UP))
        # West palissade
        create_fence_along_z(
          b_y: -1.to_b,
          b_x: 11.to_b,
          b_from_z: 0.to_b,
          b_to_z: 12.to_b,
        )
        create_fence_along_z(
          b_y: -2.to_b,
          b_x: 11.to_b,
          b_from_z: 0.to_b,
          b_to_z: 12.to_b,
        )
      end
    end
  end

  # @param [NumberOfBrick] b_y
  # @param [NumberOfBrick] b_z
  # @param [NumberOfBrick] b_from_x
  # @param [NumberOfBrick] b_to_x
  def create_fence_along_x(b_y:, b_z:, b_from_x:, b_to_x:)
    current_from_x = b_from_x
    while occupied?(x: current_from_x, y: b_y, z: b_z)
      current_from_x += 1.to_b
    end
    if current_from_x >= b_to_x
      return
    end
    current_to_x = current_from_x
    while (current_to_x < b_to_x) && (!occupied?(x: current_to_x, y: b_y || get_context_value(:b_y), z: b_z))
      current_to_x += 1.to_b
    end
    length = current_to_x - current_from_x
    elements = SetPart.calculate_fit(length, Palissade::BY_SIZE_X)
    current_x = current_from_x
    elements.each do |element|
      part = element.part_class.new
      add_part(
        b_x: current_x,
        b_y: b_y,
        b_z: b_z,
        part: part,
        m_y: -160.to_u + (1.to_b * Measures::BRICK_HEIGHT),
      )
      current_x += element.size
    end
  end

  # @param [NumberOfBrick] b_y
  # @param [NumberOfBrick] b_x
  # @param [NumberOfBrick] b_from_z
  # @param [NumberOfBrick] b_to_z
  def create_fence_along_z(b_y:, b_x:, b_from_z:, b_to_z:)
    current_from_z = b_from_z
    while occupied?(x: b_x, y: b_y, z: current_from_z)
      current_from_z += 1.to_b
    end
    if current_from_z >= b_to_z
      return
    end
    current_to_z = current_from_z
    while (current_to_z < b_to_z) && (!occupied?(x: b_x, y: b_y || get_context_value(:b_y), z: current_to_z))
      current_to_z += 1.to_b
    end
    length = current_to_z - current_from_z
    elements = SetPart.calculate_fit(length, Palissade::BY_SIZE_Z)
    current_z = current_from_z
    elements.each do |element|
      part = element.part_class.new
      add_part(
        b_x: b_x,
        b_y: b_y,
        b_z: current_z,
        part: part,
        m_y: -160.to_u + (1.to_b * Measures::BRICK_HEIGHT),
      )
      current_z += element.size
    end
  end
end
