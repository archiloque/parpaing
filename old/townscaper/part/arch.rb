module Arch
  BRICK_ARCH_1X6_RAISED_ARCH = Part.new('Brick Arch 1 x 6 Raised Arch', '92950')
end

class ArchX < Brick1X6X
  def part
    Arch::BRICK_ARCH_1X6_RAISED_ARCH
  end
end

class ArchZ < Brick1X6Z
  def part
    Arch::BRICK_ARCH_1X6_RAISED_ARCH
  end
end
