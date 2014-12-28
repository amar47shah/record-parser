module RecordParser
  class Sorter
    def initialize(records)
      @records = records
    end

    def by_gender_and_last_name
      gender_sets.flat_map(&:sort)
    end

    def by_last_name_descending
      @records.sort.reverse
    end

  private

    def gender_sets
      @records.partition { |l| l.split(' ')[2] == 'F' }
    end
  end
end
