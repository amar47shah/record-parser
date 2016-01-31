module RecordParser
  module Sorting
    class ByBirthDate
      def initialize(records)
        @records = records
      end

      def sort
        @records.sort_by(&:birth_date)
      end
    end
  end
end
