require 'spec_helper'
require 'support/shared_examples_for_sortings'

module RecordParser
  module Sorting
    describe ByGenderAndLastName do
      describe '#show' do
        it_has_behavior 'shows sorted records' do
          let(:sorting_class) { ByGenderAndLastName }
          let(:sort_method) { :by_gender_and_last_name }
        end
      end
    end
  end
end
