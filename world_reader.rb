module WorldReader
  # @return [Hash{Symbol}]
  def self.read_file
    source_map = File.readlines('map.txt', chomp: true)

    columns_match = /\AColumns: (?<columns>\d+)\z/.match(source_map[0])
    if columns_match.nil?
      raise "First line should be [Columns: XX]"
    end
    columns_number = columns_match['columns'].to_i

    lines_match = /\ALines: (?<lines>\d+)\z/.match(source_map[1])
    lines_number = lines_match['lines'].to_i
    if lines_match.nil?
      raise "Second line should be [Lines: XX]"
    end

    levels_match = /\ALevels: (?<levels>\d+)\z/.match(source_map[2])
    if levels_match.nil?
      raise "Third line should be [Levels: XX]"
    end
    levels_number = levels_match['levels'].to_i

    expected_content_lines = (levels_number * (lines_number + 1)) + 3
    unless source_map.length == expected_content_lines
      raise "Content is #{source_map.length} lines long but #{expected_content_lines} are expected"
    end

    # Check the separators between levels
    0.upto(levels_number - 1) do |level_index|
      line_index = 3 + (level_index * (lines_number + 1))
      unless /\A(\-+)\z/.match(source_map[line_index])
        raise "Line #{line_index} [#{source_map[line_index]}] should be only composed of [-] as it's a separator between levels"
      end
    end

    world_map = []
    0.upto(levels_number - 1) do |level_index|
      current_level_map = []
      0.upto(lines_number - 1) do |line_number|
        line_index_index = 4 + (level_index * (lines_number + 1)) + line_number
        current_line = source_map[line_index_index]

        if current_line.length > columns_number
          raise "Bad line length: [#{current_line}] #{current_line.length} vs #{columns_number}"
        else
          current_line = current_line.ljust(columns_number, ' ')
        end
        current_level_map << current_line.chars.map do |element|
          case element
          when ' '
            false
          when '#'
            true
          else
            raise "[#{element}] line #{line_index_index}"
          end
        end
      end
      world_map << current_level_map
    end
    {
      columns: columns_number,
      x: lines_number,
      levels: levels_number,
      map: world_map,
    }
  end
end
