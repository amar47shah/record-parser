module RecordParser
  class Record
    def initialize(line)
      @fields = line.split(' ')
    end

    def birth_date
      Date.strptime(@fields.last, '%m/%d/%Y')
    end

    def gender
      @fields[2]
    end

    def last_name
      @fields.first
    end

    def to_s
      @fields.join(' ')
    end
  end
end
