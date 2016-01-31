module RecordParser
  module Sorting
    class ByBirthDate
      def sort records
        records.sort_by(&:birth_date)
      end
    end
  end
end
