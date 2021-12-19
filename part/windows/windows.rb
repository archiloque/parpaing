require_relative 'windows_4x3'
require_relative 'windows1'
require_relative 'windows2'
require_relative 'windows_2x2'
require_relative 'windows3'

class Windows
  TYPES = [
    {
      front: Windows1Front,
      back: Windows1Back,
      left: Windows1Left,
      right: Windows1Right,
    },
    {
      front: Windows2Front,
      back: Windows2Back,
      left: Windows2Left,
      right: Windows2Right,
    },
    {
      front: Windows3Front,
      back: Windows3Back,
      left: Windows3Left,
      right: Windows3Right,
    },
  ]
end