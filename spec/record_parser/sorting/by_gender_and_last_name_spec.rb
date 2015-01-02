require 'spec_helper'
require 'support/shared_examples_for_sortings'
require 'support/stub_helper'

module RecordParser
  module Sorting
    describe ByGenderAndLastName do
      let(:sorting) { ByGenderAndLastName.new(records) }
      describe '#sort' do
        subject { sorting.sort }
        context 'with only one record' do
          let(:messages) { %i(feminine? last_name) }
          it_has_behavior 'returns the single record'
        end
        context 'with two records' do
          context 'when both masculine' do
            before do
              prepare(first , { feminine?: false, last_name: 'Chandra' })
              prepare(second, { feminine?: false, last_name: 'Robson'  })
            end
            it_has_behavior 'returns the two in correct order'
          end
          context 'when both feminine' do
            before do
              prepare(first , { feminine?: true, last_name: 'Hart' })
              prepare(second, { feminine?: true, last_name: 'Rue'  })
            end
            it_has_behavior 'returns the two in correct order'
          end
          context 'when of different gender' do
            before do
              prepare(first , { feminine?: true , last_name: 'Rue'     })
              prepare(second, { feminine?: false, last_name: 'Chandra' })
            end
            it_has_behavior 'returns the two in correct order'
          end
        end
      end
    end
  end
end
