require 'api/store'
require 'record_parser/sorter'

module API
  module Helpers
    module SortHelper
      def sort_records indexes
        sorter = RecordParser::Sorter.new indexes
        sorter.sort Store.records
      end
    end
  end
end
