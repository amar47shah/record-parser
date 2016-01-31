module RecordParser
  module Sorting
    class ByLastNameDescending
      def initialize(records)
        @records = records
      end

      def sort
        @records.sort_by(&:last_name).reverse
      end
    end
  end
end
