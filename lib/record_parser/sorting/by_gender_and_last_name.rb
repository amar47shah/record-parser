require 'record_parser/sorting/base'

module RecordParser
  module Sorting
    class ByGenderAndLastName < Base
      def sort
        gender_sets.flat_map { |same_gender| same_gender.sort_by(&:last_name) }
      end

    private

      def gender_sets
        @records.partition(&:feminine?)
      end
    end
  end
end
