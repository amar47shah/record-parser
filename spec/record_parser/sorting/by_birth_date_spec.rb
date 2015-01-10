require 'spec_helper'
require 'support/shared_examples/for_sortings'
require 'support/helpers/stub_helper'

module RecordParser
  module Sorting
    describe ByBirthDate do
      let(:sorting) { ByBirthDate.new(records) }
      describe '#sort' do
        subject { sorting.sort }
        context 'with only one record' do
          let(:messages) { %i(birth_date) }
          it_has_behavior 'returns the single record'
        end
        context 'with two records' do
          before do
            prepare(first , { birth_date: date_from('9/14/1953') })
            prepare(second, { birth_date: date_from('9/14/1984') })
          end
          it_has_behavior 'returns the two in correct order'
        end
      end
    end
  end
end
