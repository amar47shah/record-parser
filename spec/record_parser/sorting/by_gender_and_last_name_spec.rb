require 'spec_helper'
require 'support/shared_examples_for_sortings'

module RecordParser
  module Sorting
    describe ByGenderAndLastName do
      describe '#show' do
        it_has_behavior 'shows sorted records', :by_gender_and_last_name do
          let(:sorting_class) { ByGenderAndLastName }
        end
      end
    end
  end
end
