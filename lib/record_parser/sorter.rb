require 'date'

module RecordParser
  class Sorter
    def initialize(records)
      @records = records
    end

    def by_birth_date
      @records.sort_by(&:birth_date)
    end

    def by_gender_and_last_name
      gender_sets.flat_map { |set| set.sort_by(&:last_name) }
    end

    def by_last_name_descending
      @records.sort { |r, s| s.last_name <=> r.last_name }
    end

  private

    def gender_sets
      @records.partition { |record| record.gender == 'F' }
    end
  end
end
