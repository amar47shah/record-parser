require 'api/store'
require 'record_parser/sorting'

module API
  module Helpers
    module SortHelper
      def sort_records(view)
        RecordParser::Sorting.const_get(view).new(Store.records).sort
      end
    end
  end
end
