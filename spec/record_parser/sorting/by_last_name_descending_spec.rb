require 'spec_helper'
require 'support/shared_examples_for_sortings'
require 'support/helpers/stub_helper'

module RecordParser
  module Sorting
    describe ByLastNameDescending do
      let(:sorting) { ByLastNameDescending.new(records) }
      describe '#sort' do
        subject { sorting.sort }
        context 'with only one record' do
          let(:messages) { %i(last_name) }
          it_has_behavior 'returns the single record'
        end
        context 'with two records' do
          before do
            prepare(first , { last_name: 'Rue'     })
            prepare(second, { last_name: 'Chandra' })
          end
          it_has_behavior 'returns the two in correct order'
        end
      end
    end
  end
end
