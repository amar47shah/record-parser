module RecordParser
  module Sorting
    class ByBirthDate < Base
      def show
        display(Sorter.new(records).by_birth_date)
      end
    end
  end
end
