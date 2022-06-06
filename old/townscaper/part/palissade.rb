module Palissade
  PALISSADE_1X2 = Part.new('Brick Special 1 x 2 Palisade [aka Log]', '30136')
  PALISSADE_1X4 = Part.new('Brick Special 1 x 4 Palisade [aka Log]', '30137')
end

class Palissade2X < Brick1X2X
  include Palissade

  def create(color:, x:, y:, z:)
    inner_create(
      color: color,
      x: x,
      y: y,
      z: z,
      part: PALISSADE_1X2
    )
  end
end

class Palissade4X < Brick1X4X
  include Palissade

  def create(color:, x:, y:, z:)
    inner_create(
      color: color,
      x: x,
      y: y,
      z: z,
      part: PALISSADE_1X4
    )
  end
end

class Palissade2Z < Brick1X2Z
  include Palissade

  def create(color:, x:, y:, z:)
    inner_create(
      color: color,
      x: x,
      y: y,
      z: z,
      part: PALISSADE_1X2
    )
  end
end

class Palissade4Z < Brick1X4Z
  include Palissade

  def create(color:, x:, y:, z:)
    inner_create(
      color: color,
      x: x,
      y: y,
      z: z,
      part: PALISSADE_1X4
    )
  end
end

module Palissade
  BY_SIZE_Z = {
    2 => Palissade2Z,
    4 => Palissade4Z,
  }
  BY_SIZE_X = {
    2 => Palissade2X,
    4 => Palissade4X,
  }
end
