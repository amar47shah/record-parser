module RecordParser
  module Sorting
    class ByGenderAndLastName < Base
      def show
        display_records(Sorter.new(records).by_gender_and_last_name)
      end
    end
  end
end
