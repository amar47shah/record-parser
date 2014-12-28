require 'spec_helper'
require 'support/shared_examples_for_sortings'

module RecordParser
  module Sorting
    describe ByLastNameDescending do
      include_context 'setup for sorting' do
        let(:sorting_class) { ByLastNameDescending }
      end

      describe '#show_by_last_name_descending' do
        it_has_behavior 'displays heading and sorted records',
                        :show,
                        'Sorted by last name descending:',
                        :records_by_last_name_descending
      end
    end
  end
end
