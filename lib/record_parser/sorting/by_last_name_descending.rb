module RecordParser
  module Sorting
    class ByLastNameDescending
      def sort records
        records.sort_by(&:last_name).reverse
      end
    end
  end
end
