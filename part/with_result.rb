module WithResult
  def result
    @result ||= []
  end

  # @param [String] content
  # @return [void]
  def add_result(content)
    result << content
  end

  # @param [Array<String>] content
  # @return [void]
  def concat_result(content)
    result.concat(content)
  end
end