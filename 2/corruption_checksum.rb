class CorruptionChecksum
  class << self
    def calculate(spreadsheet)
      vals = []
      File.readlines(spreadsheet).each do |line|
        cleaned_line = clean(line)
        vals.push(cleaned_line.max - cleaned_line.min)
      end
      vals.reduce(&:+)
    end

    def clean(line)
      line.split(' ').map(&:to_i)
    end
  end
end

puts CorruptionChecksum.calculate(ARGV[0])
