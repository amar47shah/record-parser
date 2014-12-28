require 'spec_helper'
require 'support/shared_examples_for_sortings'

module RecordParser
  module Sorting
    describe ByLastNameDescending do
      describe '#show' do
        it_has_behavior 'shows sorted records' do
          let(:sorting_class) { ByLastNameDescending }
          let(:sort_method) { :by_last_name_descending }
        end
      end
    end
  end
end
