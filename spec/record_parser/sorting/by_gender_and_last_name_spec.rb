require 'spec_helper'
require 'support/shared_examples/for_sortings'
require 'support/helpers/stub_helper'

module RecordParser
  module Sorting
    describe ByGenderAndLastName do
      let(:sorting) { ByGenderAndLastName.new }
      describe '#sort' do
        context 'with only one record' do
          let(:messages) { %i(gender last_name) }
          it_has_behavior 'returns the single record'
        end
        context 'with two records' do
          context 'when both masculine' do
            before do
              prepare(first , { gender: 'M', last_name: 'Chandra' })
              prepare(second, { gender: 'M', last_name: 'Robson'  })
            end
            it_has_behavior 'returns the two in correct order'
          end
          context 'when both feminine' do
            before do
              prepare(first , { gender: 'F', last_name: 'Hart' })
              prepare(second, { gender: 'F', last_name: 'Rue'  })
            end
            it_has_behavior 'returns the two in correct order'
          end
          context 'when of different gender' do
            before do
              prepare(first , { gender: 'F', last_name: 'Rue'     })
              prepare(second, { gender: 'M', last_name: 'Chandra' })
            end
            it_has_behavior 'returns the two in correct order'
          end
        end
      end
    end
  end
end
