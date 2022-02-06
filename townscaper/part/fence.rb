module Fence
  FENCE_1X4X2 = Part.new('Fence Ornamented 1 x 4 x 2 with 4 Studs', '19121')
  FENCE_ROUND_3X3X3_QUARTER_ROUND = Part.new('Fence Decorative 3 x 3 x 2 Quarter Round with 2 Studs', '41823')
end

class FenceX < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Fence::FENCE_1X4X2,
        color: color,
        orientation: PartOrientation::O_0,
        x: x + 30.to_u,
        y: y - 52.to_u,
        z: z,
        ),
    ]
  end
end

class FenceY < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Fence::FENCE_1X4X2,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: y - 52.to_u,
        z: z + 30.to_u,
        ),
    ]
  end
end
