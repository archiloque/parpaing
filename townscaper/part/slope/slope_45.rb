module Slope45
  SLOPE_45_2X2 = Part.new('Slope 45° 2 x 2', '3039')
  SLOPE_45_2X4 = Part.new('Slope 45° 2 x 4', '3037')
  SLOPE_45_2X6 = Part.new('Slope 45° 2 x 6', '23949')

  SLOPE_45_2X4_DOUBLE = Part.new('Slope 45° 2 x 4 Double', '3041')
  SLOPE_45_2_2_DOUBLE_CONVEX = Part.new('Slope 45° 2 x 2 Double Convex', '3045')
  SLOPE_45_2_2_DOUBLE_CONCAVE = Part.new('Slope 45° 2 x 2 Double Concave', '3046')
end

require_relative 'slope_45_2'
require_relative 'slope_45_4'
require_relative 'slope_45_6'
require_relative 'slope_45_special'
