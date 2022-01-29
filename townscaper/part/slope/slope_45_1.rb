class Slope452X1North < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2X1,
        color: color,
        orientation: PartOrientation::O_0,
        x: x + 10.to_u,
        y: y - 28.to_u,
        z: z + 20.to_u,
      ),
    ]
  end
end

class Slope452X1South < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2X1,
        color: color,
        orientation: PartOrientation::O_180,
        x: x + 10.to_u,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class Slope452X1East < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2X1,
        color: color,
        orientation: PartOrientation::O_270,
        x: x + 20.to_u,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class Slope452X1West < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2X1,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end
