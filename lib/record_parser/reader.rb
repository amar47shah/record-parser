module RecordParser
  class Reader
    def initialize(file)
      @file = file
    end

    def records
      @file.readlines.map { |line| Record.new(line.chomp) }
    end
  end
end
