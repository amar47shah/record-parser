require 'date'

module RecordParser
  class Sorter
    def initialize(records)
      @records = records
    end

    def by_birth_date
      @records.sort { |a, b| birth_date(a) <=> birth_date(b) }
    end

    def by_gender_and_last_name
      gender_sets.flat_map(&:sort)
    end

    def by_last_name_descending
      @records.sort.reverse
    end

  private

    def birth_date(record)
      Date.strptime(record.split(' ').last, '%m/%d/%Y')
    end

    def gender(record)
      record.split(' ')[2]
    end

    def gender_sets
      @records.partition { |record| gender(record) == 'F' }
    end
  end
end
