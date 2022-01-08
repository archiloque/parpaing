module WithWalls

  # @param [Integer] y
  # @param [Integer] z
  # @param [Integer] x
  # @param [Integer] x_width
  # @return [void]
  def create_wall_along_x(y:, z:, x:, x_width:)
    current_from_x = from_x
    while occupied?(x: current_from_x, y: y, z: z)
      current_from_x += 1
    end
    if current_from_x >= to_x
      return
    end
    current_to_x = current_from_x
    while (current_to_x < to_x) && (!occupied?(x: current_to_x, y: y, z: z))
      current_to_x += 1
    end
    create_wall_segment_along_x(y: y, z: z, from_x: current_from_x, to_x: current_to_x)
    if current_to_x < to_x
      create_wall_along_x(y: y, z: z, from_x: current_to_x + 1, to_x: to_x)
    end
  end

  # @param [Integer] y
  # @param [Integer] z
  # @param [Integer] from_x
  # @param [Integer] to_x
  # @return [void]
  def create_wall_segment_along_x(y:, z:, from_x:, to_x:)
    length = to_x - from_x
    part_classes = SetPart.calculate_fit(length, Brick::BY_SIZE_X)
    if y % 2 == 1
      part_classes = part_classes.reverse
    end
    current_x = from_x
    part_classes.each do |part_classes|
      part = part_classes.new
      add_part(
        x: current_x,
        y: y,
        z: z,
        part: part,
        color: @house_definition.walls_color
      )
      current_x += part.x
    end
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] from_z
  # @param [Integer] to_z
  # @return [void]
  def create_wall_along_z(y:, x:, from_z:, to_z:)
    current_from_z = from_z
    while occupied?(z: current_from_z, y: y, x: x)
      current_from_z += 1
    end
    if current_from_z >= to_z
      return
    end
    current_to_z = current_from_z
    while (current_to_z < to_z) && (!occupied?(z: current_to_z, y: y, x: x))
      current_to_z += 1
    end
    create_wall_segment_along_z(y: y, x: x, from_z: current_from_z, to_z: current_to_z)
    if current_to_z < to_z
      create_wall_along_z(y: y, x: x, from_z: current_to_z + 1, to_z: to_z)
    end
  end

  # @param [Integer] y
  # @param [Integer] x
  # @param [Integer] from_z
  # @param [Integer] to_z
  # @return [void]
  def create_wall_segment_along_z(y:, x:, from_z:, to_z:)
    length = to_z - from_z
    part_classes = SetPart.calculate_fit(length, Brick::BY_SIZE_Z)
    if y % 2 == 1
      part_classes = part_classes.reverse
    end
    current_z = from_z
    part_classes.each do |part_classes|
      part = part_classes.new
      add_part(
        x: x,
        y: y,
        z: current_z,
        part: part,
        color: @house_definition.walls_color
      )
      current_z += part.z
    end
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @param [Color] color
  # @param [SetPart] part
  # @return [void]
  def add_part(x:, y:, z:, part:, color:)
    concat_result(
      part.create(
        color: color,
        x: @x_origin + x,
        y: @y_origin + y,
        z: @z_origin + z,
      )
    )
  end
end