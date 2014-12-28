module RecordParser
  module Sorting
    class ByLastNameDescending < Base
      def show
        display_records(Sorter.new(records).records_by_last_name_descending)
      end
    end
  end
end
