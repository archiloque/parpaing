class Slope333X4North < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_4,
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
        part: Slope33::SLOPE_33_3_4,
        color: color,
        orientation: PartOrientation::O_180,
        x: x + 30.to_u,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class Slope333X4East < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_4,
        color: color,
        orientation: PartOrientation::O_270,
        x: x + 40.to_u,
        y: y - 28.to_u,
        z: z + 30.to_u,
      ),
    ]
  end
end

class Slope333X4West < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_4,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: y - 28.to_u,
        z: z + 30.to_u,
      ),
    ]
  end
end
