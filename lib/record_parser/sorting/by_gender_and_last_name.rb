require 'record_parser/sorting/base'

module RecordParser
  module Sorting
    class ByGenderAndLastName < Base
      def sort
        @records.sort_by { |record| [record.gender, record.last_name] }
      end
    end
  end
end
