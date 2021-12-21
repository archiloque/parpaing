class Mailbox < Part
  # @param [PartOrientation] orientation
  def initialize(orientation)
    super(
      x: 2,
      y: 2,
      z: 2,)
    @orientation = orientation
  end
  
  def create(color:, x:, y:, z:)
    x_pos = ((x - 0.5) * BRICK_WIDTH)
    z_pos = ((z - 0.5) * BRICK_WIDTH)
    [
      Emitter.emit(
          part_name: 'Plate Round 2 x 2 with Axle Hole Type 1',
          part_code: '4032a',
          color: color,
          orientation: @orientation,
          y: -12,
          x: x_pos,
          z: z_pos,
      ),
      Emitter.emit(
          part_name: 'Plate Round 2 x 2 with Axle Hole Type 1',
          part_code: '4032a',
          color: color,
          orientation: @orientation,
          x: x_pos,
          y: -20,
          z: z_pos,
      ),
      Emitter.emit(
        part_name: 'Box 2 x 2 x 2',
        part_code: '4345b',
        color: color,
        orientation: @orientation,
          x: x_pos,
          y: (y * BRICK_HEIGHT) - 68,
          z: z_pos,
      ),
      Emitter.emit(
        part_name: 'Box 2 x 2 x 2 Door with Slot',
        part_code: '4346',
        color: color,
        orientation: @orientation,
          x: x_pos,
          y: (y * BRICK_HEIGHT) - 68,
          z: z_pos,
      ),
      Emitter.emit(
        part_name: 'Brick Curved 2 x 2 with Two Top Studs',
        part_code: '30165',
        color: color,
        orientation: @orientation,
          x: x_pos,
          y: (y * BRICK_HEIGHT) - 92,
          z: z_pos,
      ),]
  end
end

class MailboxLeft < Mailbox
  def initialize()
    super(PartOrientation::Z_270)
  end
end

class MailboxRight < Mailbox
  def initialize()
    super(PartOrientation::Z_90)
  end
end