module Slope33
  SLOPE_33_3_1 = Part.new('Slope 33° 3 x 1', '4286')
  SLOPE_33_3_2 = Part.new('Slope 33° 3 x 2', '3298')
  SLOPE_33_3_3 = Part.new('Slope 33° 3 x 3', '4161')
  SLOPE_33_3_4 = Part.new('Slope 33° 3 x 4', '3297')
  SLOPE_33_3_3_DOUBLE_CONCAVE = Part.new('Slope 33° 3 x 3 Double Concave', '99301')
  SLOPE_33_3_3_DOUBLE_CONVEX = Part.new('Slope 33° 3 x 3 Double Convex', '3675')
end

require_relative 'slope_33_1'
require_relative 'slope_33_2'
require_relative 'slope_33_3'
require_relative 'slope_33_4'
require_relative 'slope_33_special'
