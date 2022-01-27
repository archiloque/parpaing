require_relative 'delta'
require_relative 'basement_cell'
require_relative 'cell_positions'
require_relative 'cell_walls'
require_relative 'roof/cell_roof'

class Cell
  include Occupier
  include WithParts
  include WithWalls
  include BasementCell
  include CellWalls
  include CellPositions
  include CellRoof

  WIDTH_IN_BRICKS = 12.to_b
  HEIGHT_IN_BRICKS = 6.to_b

  WIDTH_IN_UNIT = WIDTH_IN_BRICKS * Measures::BRICK_WIDTH
  HEIGHT_IN_UNIT = (HEIGHT_IN_BRICKS * Measures::BRICK_HEIGHT) + (Measures::PLATE_HEIGHT)

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
  end

  # @param [IO] output
  # @return [void]
  def create(output)
    with(output: output) do
      if @level.level_index == 0
        create_basement
        unless up_filled?
          create_floor(-152.to_u)
        end
      else
        create_walls
        create_floor(0.to_u)
        unless up_filled?
          create_roof
        end
      end
    end
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
end
