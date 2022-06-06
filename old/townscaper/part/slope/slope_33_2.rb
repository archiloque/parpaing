class Slope333X2North < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_2,
        color: color,
        orientation: PartOrientation::O_0,
        x: x + 10.to_u,
        y: y - 28.to_u,
        z: z + 40.to_u,
      ),
    ]
  end
end

class Slope333X2South < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_2,
        color: color,
        orientation: PartOrientation::O_180,
        x: x + 10.to_u,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class Slope333X2West < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_2,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: y - 28.to_u,
        z: z + 10.to_u,
      ),
    ]
  end
end

class Slope333X2East < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_2,
        color: color,
        orientation: PartOrientation::O_270,
        x: x + 40.to_u,
        y: y - 28.to_u,
        z: z + 10.to_u,
      ),
    ]
  end
end
