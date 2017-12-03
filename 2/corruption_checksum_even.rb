class CorruptionChecksumEven
  class << self
    def calculate(spreadsheet)
      vals = []
      File.readlines(spreadsheet).each do |line|
        cleaned_line = clean(line)
        vals.push(get_val(cleaned_line))
      end
      vals.reduce(&:+)
    end

    def clean(line)
      line.split(' ').map(&:to_i)
    end

    def get_val(line)
      line.each do |val|
        filtered_line = line.select{|line_val| line_val != val}
        filtered_line.each do |line_item|
          return line_item / val if (line_item % val == 0)
        end
      end
    end
  end
end

puts CorruptionChecksumEven.calculate(ARGV[0])
