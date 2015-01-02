module RecordParser
  module Sorting
    class Base
      def initialize(records)
        @records = records
      end

    private

      def sorter
        Sorter.new(@records)
      end
    end
  end
end
