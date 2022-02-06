class Slope452X1North < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_INVERTED_45_2_1,
        color: color,
        orientation: PartOrientation::O_0,
        x: x,
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
        part: Slope45::SLOPE_INVERTED_45_2_1,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: y - 28.to_u,
        z: z,
        ),
    ]
  end
end

class Slope452X1South < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_INVERTED_45_2_1,
        color: color,
        orientation: PartOrientation::O_180,
        x: x,
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
        part: Slope45::SLOPE_INVERTED_45_2_1,
        color: color,
        orientation: PartOrientation::O_270,
        x: x,
        y: y - 28.to_u,
        z: z,
        ),
    ]
  end
end