class Slope452X4Z < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Part.new('Slope 45° 2 x 4 Double', '3041'),
        color: color,
        orientation: PartOrientation::O_0,
        x: x + 30.to_u,
        y: y - 28.to_u,
        z: z + 10.to_u,
        ),
    ]
  end
end


class Slope184X2North < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Part.new('Slope 18° 4 x 2', '30363'),
        color: color,
        orientation: PartOrientation::O_0,
        x: x + 10.to_u,
        y: y - 28.to_u,
        z: z + 60.to_u,
        ),
    ]
  end
end

class Slope184X2South < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Part.new('Slope 18° 4 x 2', '30363'),
        color: color,
        orientation: PartOrientation::O_180,
        x: x + 10.to_u,
        y: y - 28.to_u,
        z: z - 20.to_u,
        ),
    ]
  end
end

class Slope333X4North < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Part.new('Slope 33° 3 x 4', '3297'),
        color: color,
        orientation: PartOrientation::O_0,
        x: x + 30.to_u,
        y: y - 28.to_u,
        z: z + 40.to_u,
      ),
    ]
  end
end

class Slope333X4South < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Part.new('Slope 33° 3 x 4', '3297'),
        color: color,
        orientation: PartOrientation::O_180,
        x: x + 30.to_u,
        y: y - 28.to_u,
        z: z,
        ),
    ]
  end
end