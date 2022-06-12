require 'set'

class Usda

  def initialize(output)
    @output = output
    @current_indentation = 0
    write('#usda 1.0')
    write('(')
    @current_indentation += 1
    write('metersPerUnit = 1')
    write('upAxis = "Z"')
    @current_indentation -= 1
    write(')')
    write('')
    @element_index = 0
    @materials = Set.new
    @contexts = []
  end

  # @param [Usda::Context] context
  def with(context)
    @contexts << context
    yield
    @contexts.pop
  end

  # @param [Symbol] param_name
  # @return [Object, nil]
  def get_context_value(param_name)
    @contexts.reverse.each do |context|
      if context.send(param_name)
        return context.send(param_name)
      end
    end
    nil
  end

  # @param [String] name
  # @param [Usda::Color] color
  # @return [void]
  def create_material(name, color)
    if @materials.include?(name)
      raise "Material [#{name}] already defined"
    end
    @materials.add(name)
    full_name = material_name(name)
    write(%(def Material "#{full_name}"))
    block do
      write(%(token outputs:surface.connect = </#{full_name}/previewShader.outputs:surface>))
      write(%(def Shader "previewShader"))
      block do
        write(%(uniform token info:id = "UsdPreviewSurface"))
        write(%(color3f inputs:diffuseColor = (#{color.r}, #{color.g}, #{color.b})))
        write(%(float inputs:metallic = 0))
        write(%(float inputs:roughness = 0.4))
        write(%(token outputs:surface))
      end
    end
  end

  # @param [String, nil] material
  # @param [Usda::Coordinates] position
  # @param [Usda::Dimension] dimension
  # @return [void]
  def create_rectangular_cuboid(material: nil, position:, dimension:)
    material ||= get_context_value(:material)
    position_x = position.x + (get_context_value(:position) ? get_context_value(:position).x : 0)
    position_y = position.y + (get_context_value(:position) ? get_context_value(:position).y : 0)
    position_z = position.z + (get_context_value(:position) ? get_context_value(:position).z : 0)

    unless @materials.include?(material)
      raise "Material [#{material}] is unknown"
    end
    element_name = %(Rectangular_cuboid_#{@element_index})
    write(%(def Xform "#{element_name}_xform"))
    block do
      write(%(matrix4d xformOp:transform = ( (#{dimension.x}, 0, 0, 0), (0, #{dimension.y}, 0, 0), (0, 0, #{dimension.z}, 0), (#{position_x }, #{position_y }, #{position_z }, 1) )))
      write(%(uniform token[] xformOpOrder = ["xformOp:transform"]))
      write(%(def Mesh "#{element_name}"))
      block do
        write(%(uniform bool doubleSided = 1))
        write(%(int[] faceVertexCounts = [4, 4, 4, 4, 4, 4]))
        write(%(int[] faceVertexIndices = [0, 4, 6, 2, 3, 2, 6, 7, 7, 6, 4, 5, 5, 1, 3, 7, 1, 0, 2, 3, 5, 4, 0, 1]))
        write(%(normal3f[] normals = [(0, 0, 1), (0, 0, 1), (0, 0, 1), (0, 0, 1), (0, -1, 0), (0, -1, 0), (0, -1, 0), (0, -1, 0), (-1, 0, 0), (-1, 0, 0), (-1, 0, 0), (-1, 0, 0), (0, 0, -1), (0, 0, -1), (0, 0, -1), (0, 0, -1), (1, 0, 0), (1, 0, 0), (1, 0, 0), (1, 0, 0), (0, 1, 0), (0, 1, 0), (0, 1, 0), (0, 1, 0)] (\ninterpolation = "faceVarying"\n)))
        write(%(point3f[] points = [(1, 1, 1), (1, 1, 0), (1, 0, 1), (1, 0, 0), (0, 1, 1), (0, 1, 0), (0, 0, 1), (0, 0, 0)]))
        write(%(rel material:binding = </#{material_name(material)}>))
        write(%(texCoord2f[] primvars:UVMap = [(0.625, 0.5), (0.875, 0.5), (0.875, 0.75), (0.625, 0.75), (0.375, 0.75), (0.625, 0.75), (0.625, 1), (0.375, 1), (0.375, 0), (0.625, 0), (0.625, 0.25), (0.375, 0.25), (0.125, 0.5), (0.375, 0.5), (0.375, 0.75), (0.125, 0.75), (0.375, 0.5), (0.625, 0.5), (0.625, 0.75), (0.375, 0.75), (0.375, 0.25), (0.625, 0.25), (0.625, 0.5), (0.375, 0.5)] (\n    interpolation = "faceVarying"\n)))
        write(%(uniform token subdivisionScheme = "none"))
      end
    end
    @element_index += 1
  end

  # @param [Usda::Coordinates] position
  # @return [void]
  def create_light(position:)
    position_x = position.x + (get_context_value(:position) ? get_context_value(:position).x : 0)
    position_y = position.y + (get_context_value(:position) ? get_context_value(:position).y : 0)
    position_z = position.z + (get_context_value(:position) ? get_context_value(:position).z : 0)

    element_name = %(Light_#{@element_index})
    write(%(def Xform "#{element_name}"))
    block do
      write(%(matrix4d xformOp:transform = ( (1, 0, 0, 0), (0, 1, 0, 0), (0, 0, 1, 0), (#{position_x}, #{position_y}, #{position_z}, 1) )))
      write(%(uniform token[] xformOpOrder = ["xformOp:transform"]))
      write(%(def SphereLight "#{element_name}"))
      block do
        write(%(color3f inputs:color = (1, 1, 1)))
        write(%(float inputs:intensity = 2000))
        write(%(float inputs:radius = 0.1))
        write(%(float inputs:specular = 1))
      end
    end
    @element_index += 1
  end

  private

  # @param [String] line
  # @return [void]
  def write(line)
    @output << %(#{'    ' * @current_indentation}#{line}\n)
  end

  # @return [void]
  def block
    write('{')
    @current_indentation += 1
    yield
    @current_indentation -= 1
    write('}')
  end

  # @param [String] name
  # @return [String]
  def material_name(name)
    %(Material_#{name})
  end

end

require_relative 'color'
require_relative 'coordinates'
require_relative 'dimension'
require_relative 'context'
