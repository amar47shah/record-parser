require 'spec_helper'
require 'support/shared_examples_for_sortings'

module RecordParser
  module Sorting
    describe ByBirthDate do
      describe '#show' do
        it_has_behavior 'shows sorted records' do
          let(:sorting_class) { ByBirthDate }
          let(:sort_method) { :by_birth_date }
        end
      end
    end
  end
end
