require 'spec_helper'
require 'support/shared_examples_for_sortings'

module RecordParser
  module Sorting
    describe ByGenderAndLastName do
      describe '#sort' do
        it_has_behavior 'sorts records', :by_gender_and_last_name do
          let(:sorting_class) { ByGenderAndLastName }
        end
      end
    end
  end
end
