class Slope333X3North < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_3,
        color: color,
        orientation: PartOrientation::O_0,
        x: x + 20.to_u,
        y: y - 28.to_u,
        z: z + 40.to_u,
      ),
    ]
  end
end

class Slope333X3South < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_3,
        color: color,
        orientation: PartOrientation::O_180,
        x: x + 30.to_u,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class Slope333X3East < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_3,
        color: color,
        orientation: PartOrientation::O_270,
        x: x + 40.to_u,
        y: y - 28.to_u,
        z: z + 20.to_u,
      ),
    ]
  end
end
