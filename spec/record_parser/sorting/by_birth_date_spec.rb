require 'spec_helper'
require 'support/shared_examples_for_sortings'

module RecordParser
  module Sorting
    describe ByBirthDate do
      describe '#sort' do
        it_has_behavior 'sorts records', :by_birth_date do
          let(:sorting_class) { ByBirthDate }
        end
      end
    end
  end
end
