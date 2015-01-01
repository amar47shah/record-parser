require 'spec_helper'
require 'support/shared_examples_for_sortings'

module RecordParser
  module Sorting
    describe ByBirthDate do
      describe '#show' do
        it_has_behavior 'shows sorted records', :by_birth_date do
          let(:sorting_class) { ByBirthDate }
        end
      end
    end
  end
end
