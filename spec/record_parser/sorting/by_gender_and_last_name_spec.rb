require 'spec_helper'
require 'support/shared_examples_for_sortings'

module RecordParser
  module Sorting
    describe ByGenderAndLastName do
      include_context 'setup for sorting' do
        let(:sorting_class) { ByGenderAndLastName }
      end

      describe '#show' do
        it_has_behavior 'displays heading and sorted records',
                        :show,
                        'Sorted by gender and last name:',
                        :records_by_gender_and_last_name
      end
    end
  end
end
