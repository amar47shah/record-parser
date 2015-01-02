require 'spec_helper'
require 'support/shared_examples_for_sortings'

module RecordParser
  module Sorting
    describe ByLastNameDescending do
      describe '#sort' do
        it_has_behavior 'sorts records', :by_last_name_descending do
          let(:sorting_class) { ByLastNameDescending }
        end
      end
    end
  end
end
