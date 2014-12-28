module RecordParser
  module Sorting
    class ByLastNameDescending < Base
      def show
        display_records(Sorter.new(records).by_last_name_descending)
      end
    end
  end
end
