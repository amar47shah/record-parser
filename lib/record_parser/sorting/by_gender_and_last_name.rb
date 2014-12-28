module RecordParser
  module Sorting
    class ByGenderAndLastName < Base
      def show
        display_heading('Sorted by gender and last name:')
        display_records(Sorter.new(records).records_by_gender_and_last_name)
      end
    end
  end
end
