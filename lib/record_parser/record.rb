require 'date'

module RecordParser
  class Record
    def initialize(string)
      @fields = string.delete(',|').split(' ')
    end

    def birth_date
      Date.strptime(@fields.last, '%m/%d/%Y')
    end

    def feminine?
      gender == 'F'
    end

    def last_name
      @fields.first.delete(',')
    end

    def to_s
      @fields.join(' ')
    end

  private

    def gender
      @fields[2][0]
    end
  end
end
