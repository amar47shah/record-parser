module RecordParser
  module Sorting
    class ByBirthDate < Base
      def sort
        @records.sort_by(&:birth_date)
      end
    end
  end
end
