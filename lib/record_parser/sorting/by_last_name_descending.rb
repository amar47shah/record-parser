require 'record_parser/sorting/base'

module RecordParser
  module Sorting
    class ByLastNameDescending < Base
      def sort
        @records.sort { |first, second| second.last_name <=> first.last_name }
      end
    end
  end
end
