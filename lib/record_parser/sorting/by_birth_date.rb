module RecordParser
  module Sorting
    class ByBirthDate < Base
      def sort
        sorter.by_birth_date
      end
    end
  end
end
