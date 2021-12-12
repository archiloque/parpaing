class HousesBlock
  FENCE_WIDTH = 1
  SPACE_BETWEEN_HOUSE_AND_FENCE = 2
  USABLE_BLOCKS_IN_CROSS_BASEPLATES = 3
  STRAIGHT_BASEPLATES_IN_HOUSES_GROUP = 5
  BLOCKS_IN_HOUSE_BLOCKS = ((USABLE_BLOCKS_IN_CROSS_BASEPLATES - SPACE_BETWEEN_HOUSE_AND_FENCE - FENCE_WIDTH) * 2) + (Part::BASEPLATE_WIDTH * STRAIGHT_BASEPLATES_IN_HOUSES_GROUP)
  WIDTH_BETWEEN_HOUSES = FENCE_WIDTH + (SPACE_BETWEEN_HOUSE_AND_FENCE * 2)

  MIN_HOUSE_WIDTH = 6
  MAX_HOUSE_WIDTH = 30
  HOUSE_DEPTH = 10
  HOUSE_HEIGHT = 5

  include WithResult

  # @param [Integer] x_origin
  # @param [Integer] z_origin
  def initialize(x_origin:, z_origin:)
    @x_origin = x_origin
    @z_origin = z_origin
  end

  # @return [Array<String>]
  def create()
    add_crossroads(
      x: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES),
      z: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES),
    )
    add_road_toward_z(
      x: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES),
      z: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES) + Part::BASEPLATE_WIDTH,
    )

    0.upto(STRAIGHT_BASEPLATES_IN_HOUSES_GROUP - 1) do |index|
      add_road_toward_x(
        x: USABLE_BLOCKS_IN_CROSS_BASEPLATES + (index * Part::BASEPLATE_WIDTH),
        z: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES),
      )
      add_green_base_plate(
        x: USABLE_BLOCKS_IN_CROSS_BASEPLATES + (index * Part::BASEPLATE_WIDTH),
        z: -(Part::BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASEPLATES) + Part::BASEPLATE_WIDTH,
      )
    end

    create_fences()
    create_front_facing_houses()
    create_back_facing_houses()
    result
  end

  private

  # @param [Integer] z
  # @param [Integer] x
  # @return [void]
  def add_crossroads(x:, z:)
    concat_result(
      Crossroads
        .new
        .create(
          color: Color::DARK_BLUISH_GRAY,
          x: @x_origin + x,
          y: 0,
          z: @z_origin + z,
        )
    )
  end

  # @param [Integer] z
  # @param [Integer] x
  # @return [void]
  def add_road_toward_z(x:, z:)
    concat_result(
      RoadTowardZ
        .new
        .create(
          color: Color::DARK_BLUISH_GRAY,
          x: @x_origin + x,
          y: 0,
          z: @z_origin + z,
        )
    )
  end

  # @param [Integer] z
  # @param [Integer] x
  # @return [void]
  def add_road_toward_x(x:, z:)
    concat_result(
      RoadTowardX
        .new
        .create(
          color: Color::DARK_BLUISH_GRAY,
          x: @x_origin + x,
          y: 0,
          z: @z_origin + z,
        )
    )
  end

  # @param [Integer] z
  # @param [Integer] x
  # @return [void]
  def add_green_base_plate(x:, z:)
    concat_result(
      GreenBasePlate
        .new
        .create(
          color: Color::GREEN,
          x: @x_origin + x,
          y: 0,
          z: @z_origin + z,
        )
    )
  end

  def create_fences()
    # Between houses
    from_x = -USABLE_BLOCKS_IN_CROSS_BASEPLATES
    to_x = (Part::BASEPLATE_WIDTH * STRAIGHT_BASEPLATES_IN_HOUSES_GROUP) - 1
    create_fence_between_houses_groups(
      z: (Part::BASEPLATE_WIDTH / 2) + 2,
      from_x: from_x,
      to_x: to_x,
    )
    create_fence_between_houses_groups(
      z: (Part::BASEPLATE_WIDTH / 2) + 3,
      from_x: from_x,
      to_x: to_x,
    )

    # Before first houses
    create_fence_between_front_facing_houses(
      x: 0,
    )
    create_fence_between_back_facing_houses(
      x: 0,
    )
  end

  # @param [Integer] z
  # @param [Integer] from_x
  # @param [Integer] to_x
  # @return [void]
  def create_fence_between_houses_groups(z:, from_x:, to_x:)
    fence_length = to_x - from_x
    case (fence_length % 4)
    when 0
      current_x = from_x
    when 2
      current_x = from_x + 1
    else
      raise (fence_length % 4).to_s
    end
    fence = FenceTowardX.new
    while current_x < to_x
      concat_result(
        fence.create(
          color: Color::WHITE,
          x: @x_origin + current_x,
          y: 0,
          z: @z_origin + z,
        )
      )
      current_x += fence.x
    end
  end

  # @param [Integer] x
  # @param [Integer] from_z
  # @param [Integer] to_z
  # @return [void]
  def create_fence_between_houses(x:, from_z:, to_z:)
    current_z = from_z
    fence = FenceTowardZ.new
    unless (to_z - from_z) % fence.z == 0
      raise "#{(to_z - from_z).to_s} #{fence.z}"
    end
    while current_z - fence.z >= to_z
      concat_result(
        fence.create(
          color: Color::WHITE,
          x: @x_origin + x,
          y: 0,
          z: @z_origin + current_z,
        )
      )
      current_z -= fence.z
    end
  end

  # @param [Integer] x
  # @return [void]
  def create_fence_between_front_facing_houses(x:)
    create_fence_between_houses(
      x: x,
      from_z: (Part::BASEPLATE_WIDTH / 2) + 1,
      to_z: 1,
    )
  end

  # @param [Integer] x
  # @return [void]
  def create_fence_between_back_facing_houses(x:)
    create_fence_between_houses(
      x: x,
      from_z: (Part::BASEPLATE_WIDTH) + 3,
      to_z: (Part::BASEPLATE_WIDTH / 2) + 3,
    )
  end

  # @return [void]
  def create_front_facing_houses()
    x = FENCE_WIDTH + SPACE_BETWEEN_HOUSE_AND_FENCE
    find_houses_list do |house_width|
      concat_result(
        House.new(
          x_origin: @x_origin + x,
          x_width: house_width,
          z_origin: @z_origin + 0,
          z_width: HOUSE_DEPTH,
          height: HOUSE_HEIGHT,
        ).create_front_facing()
      )

      x += house_width + SPACE_BETWEEN_HOUSE_AND_FENCE
      create_fence_between_front_facing_houses(
        x: x,
      )
      x += SPACE_BETWEEN_HOUSE_AND_FENCE + FENCE_WIDTH
    end
  end

  def create_back_facing_houses()
    x = FENCE_WIDTH + SPACE_BETWEEN_HOUSE_AND_FENCE
    find_houses_list do |house_width|
      concat_result(
        House.new(
          x_origin: @x_origin + x,
          x_width: house_width,
          z_origin: @z_origin + Part::BASEPLATE_WIDTH + (2 * USABLE_BLOCKS_IN_CROSS_BASEPLATES) - HOUSE_DEPTH,
          z_width: HOUSE_DEPTH,
          height: HOUSE_HEIGHT,
        ).create_back_facing()
      )

      x += house_width + SPACE_BETWEEN_HOUSE_AND_FENCE
      create_fence_between_back_facing_houses(
        x: x,
      )
      x += SPACE_BETWEEN_HOUSE_AND_FENCE + FENCE_WIDTH
    end
  end

  def find_houses_list()
    houses_list = nil
    until houses_list
      houses_list = find_houses_list_inner()
    end

    houses_list.shuffle.each do |house_width|
      yield(house_width)
    end
  end

  # @return [Array<Integer>, nil]
  def find_houses_list_inner()
    houses_list = []
    current_houses_width = 0
    while true
      if (BLOCKS_IN_HOUSE_BLOCKS - current_houses_width) < MIN_HOUSE_WIDTH
        return nil
      elsif (BLOCKS_IN_HOUSE_BLOCKS - current_houses_width) <= MAX_HOUSE_WIDTH
        houses_list << (BLOCKS_IN_HOUSE_BLOCKS - current_houses_width)
        return houses_list
      else
        house_width = (MIN_HOUSE_WIDTH..MAX_HOUSE_WIDTH).to_a.sample
        houses_list << house_width
        current_houses_width += house_width + WIDTH_BETWEEN_HOUSES
      end
    end
  end
end