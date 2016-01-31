require 'api/store'
require 'record_parser/sorting'

module API
  module Helpers
    module SortHelper
      def sort_records(view)
        RecordParser::Sorting.const_get(view).new.sort Store.records
      end
    end
  end
end
