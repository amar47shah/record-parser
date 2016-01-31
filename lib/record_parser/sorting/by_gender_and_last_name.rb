module RecordParser
  module Sorting
    class ByGenderAndLastName
      def initialize(records)
        @records = records
      end

      def sort
        @records.sort_by { |record| [record.gender, record.last_name] }
      end
    end
  end
end
