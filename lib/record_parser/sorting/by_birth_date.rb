module RecordParser
  module Sorting
    class ByBirthDate < Base
      def sort
        Sorter.new(records).by_birth_date
      end
    end
  end
end
