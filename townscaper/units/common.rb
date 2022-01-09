module Common
  # @param [Object] value
  # @param [Class] type
  # @return [void]
  def check_type(value, type)
    unless value.is_a?(type)
      raise "#{value} is not a #{type}"
    end
  end
end