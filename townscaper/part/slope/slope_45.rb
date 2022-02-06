module Slope45
  SLOPE_45_2X1 = Part.new('Slope 45° 2 x 1', '3040b')
  SLOPE_45_2X2 = Part.new('Slope 45° 2 x 2', '3039')
  SLOPE_45_2X4 = Part.new('Slope 45° 2 x 4', '3037')
  SLOPE_45_2X6 = Part.new('Slope 45° 2 x 6', '23949')

  SLOPE_45_2X4_DOUBLE = Part.new('Slope 45° 2 x 4 Double', '3041')
  SLOPE_45_2X1_DOUBLE = Part.new('Slope 45° 2 x 1 Double with Inside Stud Holder', '3044a')

  SLOPE_45_2_2_DOUBLE_CONVEX = Part.new('Slope 45° 2 x 2 Double Convex', '3045')
  SLOPE_45_2_2_DOUBLE_CONCAVE = Part.new('Slope 45° 2 x 2 Double Concave', '3046')

  SLOPE_45_2_2_DOUBLE_CONVEX_DOUBLE_CONCAVE = Part.new('Slope 45° 2 x 2 Double Convex / Double Concave', '962')

  SLOPE_45_2_1_DOUBLE_INVERTED = Part.new('Slope 45° 2 x 1 Double / Inverted with Bottom Stud Holder', '3049d')

  SLOPE_INVERTED_45_2_1 = Part.new('Slope Inverted 45° 2 x 1', '3665')
  SLOPE_INVERTED_45_2_2_DOUBLE_CONVEX = Part.new('Slope Inverted 45° 2 x 2 Double Convex', '3676')
end

require_relative 'slope_45_1'
require_relative 'slope_45_1_inverted'
require_relative 'slope_45_2'
require_relative 'slope_45_2_inverted'
require_relative 'slope_45_4'
require_relative 'slope_45_6'
require_relative 'slope_45_special'
