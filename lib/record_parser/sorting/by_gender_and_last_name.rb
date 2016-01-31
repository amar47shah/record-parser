module RecordParser
  module Sorting
    class ByGenderAndLastName
      def sort records
        records.sort_by { |record| [record.gender, record.last_name] }
      end
    end
  end
end
