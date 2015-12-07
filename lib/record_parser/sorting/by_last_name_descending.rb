require 'record_parser/sorting/base'

module RecordParser
  module Sorting
    class ByLastNameDescending < Base
      def sort
        @records.sort_by(&:last_name).reverse
      end
    end
  end
end
