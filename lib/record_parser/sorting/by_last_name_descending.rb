module RecordParser
  module Sorting
    class ByLastNameDescending < Base
      def sort
        sorter.by_last_name_descending
      end
    end
  end
end
