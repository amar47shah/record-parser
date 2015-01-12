module API
  module Helpers
    module SortHelper
      def sort(records, view)
        RecordParser::Sorting.const_get(view).new(records).sort
      end
    end
  end
end
