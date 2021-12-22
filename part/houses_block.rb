class HousesBlock
  include Measures
  FENCE_WIDTH = 1
  SPACE_BETWEEN_HOUSE_AND_FENCE = 2
  USABLE_BLOCKS_IN_CROSS_BASE_PLATES = 3
  STRAIGHT_BASEPLATES_IN_HOUSES_GROUP = 5
  BLOCKS_IN_HOUSE_BLOCKS = ((USABLE_BLOCKS_IN_CROSS_BASE_PLATES - SPACE_BETWEEN_HOUSE_AND_FENCE - FENCE_WIDTH) * 2) + (BASEPLATE_WIDTH * STRAIGHT_BASEPLATES_IN_HOUSES_GROUP)
  WIDTH_BETWEEN_HOUSES = FENCE_WIDTH + (SPACE_BETWEEN_HOUSE_AND_FENCE * 2)

  MIN_HOUSE_WIDTH = 6
  MAX_HOUSE_WIDTH = 30
  HOUSE_DEPTH = 10
  HOUSE_HEIGHT = 5

  include WithResult
  include Occupier

  # @param [Integer] x_origin
  # @param [Integer] z_origin
  def initialize(x_origin:, z_origin:)
    @x_origin = x_origin
    @z_origin = z_origin
  end

  # @return [Array<String>]
  def create()
    add_crossroads(
      x: -(BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASE_PLATES),
      z: -(BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASE_PLATES),
    )
    add_road_toward_z(
      x: -(BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASE_PLATES),
      z: -(BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASE_PLATES) + BASEPLATE_WIDTH,
    )

    0.upto(STRAIGHT_BASEPLATES_IN_HOUSES_GROUP - 1) do |index|
      add_road_toward_x(
        x: USABLE_BLOCKS_IN_CROSS_BASE_PLATES + (index * BASEPLATE_WIDTH),
        z: -(BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASE_PLATES),
      )
      add_green_base_plate(
        x: USABLE_BLOCKS_IN_CROSS_BASE_PLATES + (index * BASEPLATE_WIDTH),
        z: -(BASEPLATE_WIDTH - USABLE_BLOCKS_IN_CROSS_BASE_PLATES) + BASEPLATE_WIDTH,
      )
    end

    create_lamp_posts
    create_mailboxes
    create_fences
    create_front_facing_houses
    create_back_facing_houses
    result
  end

  private

  def create_lamp_posts
    lamp_post = LampPost.new
    [-4, 6 + (STRAIGHT_BASEPLATES_IN_HOUSES_GROUP * BASEPLATE_WIDTH)].each do |x|
      [-3, 39].each do |z|
        concat_result(
          lamp_post.create(
            color: Color::WHITE,
            x: @x_origin + x,
            y: 0,
            z: @z_origin + z,
          )
        )
      end
    end
  end

  def create_mailboxes
    concat_result(
      MailboxLeft.new.create(
        color: Color::YELLOW,
        x: @x_origin - 1,
        y: 0,
        z: @z_origin + 19,
      )
    )
    concat_result(
      MailboxRight.new.create(
        color: Color::YELLOW,
        x: @x_origin + (STRAIGHT_BASEPLATES_IN_HOUSES_GROUP * BASEPLATE_WIDTH) + 5,
        y: 0,
        z: @z_origin + 19,
      )
    )
  end

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
    from_x = -USABLE_BLOCKS_IN_CROSS_BASE_PLATES
    to_x = (BASEPLATE_WIDTH * STRAIGHT_BASEPLATES_IN_HOUSES_GROUP) - 1
    create_fence_between_houses_groups(
      z: (BASEPLATE_WIDTH / 2) + 2,
      from_x: from_x,
      to_x: to_x,
    )
    create_fence_between_houses_groups(
      z: (BASEPLATE_WIDTH / 2) + 3,
      from_x: from_x,
      to_x: to_x,
    )

    # Before first houses
    create_fence_between_front_facing_houses(
      x: @x_origin,
    )
    create_fence_between_back_facing_houses(
      x: @x_origin,
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
          x: x,
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
      from_z: (BASEPLATE_WIDTH / 2) + 1,
      to_z: 1,
    )
  end

  # @param [Integer] x
  # @return [void]
  def create_fence_between_back_facing_houses(x:)
    create_fence_between_houses(
      x: x,
      from_z: (BASEPLATE_WIDTH) + 3,
      to_z: (BASEPLATE_WIDTH / 2) + 3,
    )
  end

  # @param [Integer] x
  # @param [Integer] house_width
  # @param [Integer] z
  def create_trash_can(x:, house_width:, z:)
    if Kernel.rand(5) == 0
      concat_result(
        TrashCan.new.create(
          x: x - 2,
          y: 0,
          z: @z_origin + z,
          color: Color::RED,
        )
      )
    elsif Kernel.rand(5) == 0
      concat_result(
        TrashCan.new.create(
          x: house_width + x,
          y: 0,
          z: @z_origin + z,
          color: Color::RED,
        )
      )
    end
  end

  # @param [Integer] from_x
  # @param [Integer] to_x
  # @param [Integer] from_z
  # @param [Integer] to_z
  # @param [SetPart] tree
  # @return [void]
  def create_trees(from_x:, to_x:, from_z:, to_z:, tree:)
    from_x.upto(to_x) do |x|
      from_z.upto(to_z) do |z|
        if Kernel.rand(100) >= 99
          unless occupied_zone?(
            from_x: x,
            to_x: x + tree.x - 1,
            y: 0,
            from_z: z,
            to_z: z + tree.z - 1,
          )
            concat_result(
              tree.create(
                color: Color::GREEN,
                x: x,
                y: 0,
                z: z,
              )
            )
            occupy_zone(
              from_x: x,
              to_x: x + tree.x - 1,
              y: 0,
              from_z: z,
              to_z: z + tree.z - 1,
            )
          end
        end
      end
    end
  end

  # @return [Integer]
  def house_height
    if Kernel.rand(100) >= 95
      HOUSE_HEIGHT + 1
    else
      HOUSE_HEIGHT
    end
  end

  # @return [void]
  def create_front_facing_houses()
    x = FENCE_WIDTH + SPACE_BETWEEN_HOUSE_AND_FENCE + @x_origin
    find_houses_list do |house_definition|
      if house_definition.garage != Garage::NO_GARAGE
        concat_result(
          Garage.new(
            x_origin: x + house_definition.garage_start_delta_x,
            z_origin: @z_origin,
            z_width: HOUSE_DEPTH,
            house_definition: house_definition,
          ).create_front_facing
        )
      end

      concat_result(
        House.new(
          x_origin: x + house_definition.house_start_delta_x,
          x_width: house_definition.house_width,
          z_origin: @z_origin,
          z_width: HOUSE_DEPTH,
          height: house_height,
          house_definition: house_definition,
        ).create_front_facing
      )

      create_trash_can(
        x: x,
        house_width: house_definition.total_width,
        z: 1,
      )
      create_trees(
        from_x: x - 2,
        to_x: x + house_definition.total_width - 2,
        from_z: @z_origin + HOUSE_DEPTH + 2,
        to_z: @z_origin + HOUSE_DEPTH + 5,
        tree: FruitTree.new,
      )

      x += house_definition.total_width + SPACE_BETWEEN_HOUSE_AND_FENCE
      create_fence_between_front_facing_houses(
        x: x,
      )
      x += SPACE_BETWEEN_HOUSE_AND_FENCE + FENCE_WIDTH
    end
  end

  def create_back_facing_houses()
    x = FENCE_WIDTH + SPACE_BETWEEN_HOUSE_AND_FENCE + @x_origin
    find_houses_list do |house_definition|
      if house_definition.garage != Garage::NO_GARAGE
        concat_result(
          Garage.new(
            x_origin: x + house_definition.garage_start_delta_x,
            z_origin: @z_origin + BASEPLATE_WIDTH + (2 * USABLE_BLOCKS_IN_CROSS_BASE_PLATES) - HOUSE_DEPTH,
            z_width: HOUSE_DEPTH,
            house_definition: house_definition,
            ).create_back_facing
        )
      end

      concat_result(
        House.new(
          x_origin: x + house_definition.house_start_delta_x,
          x_width: house_definition.house_width,
          z_origin: @z_origin + BASEPLATE_WIDTH + (2 * USABLE_BLOCKS_IN_CROSS_BASE_PLATES) - HOUSE_DEPTH,
          z_width: HOUSE_DEPTH,
          height: house_height,
          house_definition: house_definition,
        ).create_back_facing
      )

      create_trash_can(
        x: x,
        house_width: house_definition.total_width,
        z: BASEPLATE_WIDTH + (2 * USABLE_BLOCKS_IN_CROSS_BASE_PLATES) - 2,
      )
      create_trees(
        from_x: x - 2,
        to_x: x + house_definition.total_width - 2,
        from_z: @z_origin + BASEPLATE_WIDTH + (2 * USABLE_BLOCKS_IN_CROSS_BASE_PLATES) - HOUSE_DEPTH - 6,
        to_z: @z_origin + BASEPLATE_WIDTH + (2 * USABLE_BLOCKS_IN_CROSS_BASE_PLATES) - HOUSE_DEPTH - 4,
        tree: FruitTree.new,
      )

      x += house_definition.total_width + SPACE_BETWEEN_HOUSE_AND_FENCE
      create_fence_between_back_facing_houses(
        x: x,
      )
      x += SPACE_BETWEEN_HOUSE_AND_FENCE + FENCE_WIDTH
    end
  end

  # @yieldparam [HouseDefinition]
  # @return [void]
  def find_houses_list()
    houses_list = nil
    until houses_list
      houses_list = find_houses_list_inner
    end

    houses_list.shuffle.each do |house_width|
      yield(house_width)
    end
  end

  # @return [Array<HouseDefinition>, nil]
  def find_houses_list_inner()
    houses_list = []
    current_houses_width = 0
    while true
      if (BLOCKS_IN_HOUSE_BLOCKS - current_houses_width) < MIN_HOUSE_WIDTH
        return nil
      elsif (BLOCKS_IN_HOUSE_BLOCKS - current_houses_width) <= MAX_HOUSE_WIDTH
        houses_list << HouseDefinition.new((BLOCKS_IN_HOUSE_BLOCKS - current_houses_width), Garage::NO_GARAGE)
        return houses_list
      else
        house_width = (MIN_HOUSE_WIDTH..MAX_HOUSE_WIDTH).to_a.sample
        house_definition = HouseDefinition.new(house_width)
        houses_list << house_definition
        current_houses_width += WIDTH_BETWEEN_HOUSES + house_definition.total_width
      end
    end
  end

  class HouseDefinition
    attr_reader :house_width, :garage, :walls_color, :door_and_windows_color, :windows_type
    # @param [Integer] house_width
    # @param [Integer, nil] garage
    def initialize(house_width, garage = nil)
      @house_width = house_width
      if garage.nil?
        if Kernel.rand(10) >= 7
          @garage = Garage::GARAGE_ON_LEFT
        elsif Kernel.rand(10) >= 7
          @garage = Garage::GARAGE_ON_RIGHT
        else
          @garage = Garage::NO_GARAGE
        end
      else
        @garage = garage
      end

      @walls_color = BuildingColors::COLORS.keys.sample
      @door_and_windows_color = BuildingColors::COLORS[@walls_color].sample
      @windows_type = Windows::TYPES.sample
    end

    # @return [Integer]
    def total_width
      @house_width + ((@garage == Garage::NO_GARAGE) ? 0 : Garage::GARAGE_WIDTH)
    end

    # @return [Integer]
    def house_start_delta_x
      (@garage == Garage::GARAGE_ON_LEFT) ? Garage::GARAGE_WIDTH : 0
    end

    # @return [Integer]
    def garage_start_delta_x
      (@garage == Garage::GARAGE_ON_LEFT) ? 0 : @house_width
    end
  end
end
