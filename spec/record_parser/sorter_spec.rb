require 'spec_helper'
require 'support/helpers/date_helper'

module RecordParser
  describe Sorter do
    describe '#sort' do
      shared_examples 'returns the single record' do
        subject { Sorter.new(indexes).sort records }
        let(:only_record) { double('OnlyRecord') }
        let(:records) { [only_record] }
        before { messages.each { |m| allow(only_record).to receive m } }
        it { is_expected.to eq([only_record]) }
      end

      shared_examples 'returns the two in correct order' do
        subject { Sorter.new(indexes).sort records }
        let(:first) { double('FirstRecord') }
        let(:second) { double('SecondRecord') }
        let(:in_correct_order) { [first, second] }
        before do
          allow(first).to receive_messages first_messages
          allow(second).to receive_messages second_messages
        end
        context 'when already in order' do
          let(:records) { in_correct_order }
          it { is_expected.to eq(in_correct_order) }
        end
        context 'when switched' do
          let(:records) { in_correct_order.reverse }
          it { is_expected.to eq(in_correct_order) }
        end
      end

      context 'by birth date' do
        let(:indexes) { { birth_date: :asc } }
        context 'with only one record' do
          let(:messages) { %i(birth_date) }
          it_has_behavior 'returns the single record'
        end
        context 'with two records' do
          let(:first_messages) { { birth_date: date_from('9/14/1953') } }
          let(:second_messages) { { birth_date: date_from('9/14/1984') } }
          it_has_behavior 'returns the two in correct order'
        end
      end

      context 'by gender and last name' do
        let(:indexes) { { gender: :asc, last_name: :asc } }
        context 'with only one record' do
          let(:messages) { %i(gender last_name) }
          it_has_behavior 'returns the single record'
        end
        context 'with two records' do
          context 'when both masculine' do
            let(:first_messages) { { gender: 'M', last_name: 'Chandra' } }
            let(:second_messages) { { gender: 'M', last_name: 'Robson' } }
            it_has_behavior 'returns the two in correct order'
          end
          context 'when both feminine' do
            let(:first_messages) { { gender: 'F', last_name: 'Hart' } }
            let(:second_messages) { { gender: 'F', last_name: 'Rue' } }
            it_has_behavior 'returns the two in correct order'
          end
          context 'when of different gender' do
            let(:first_messages) { { gender: 'F', last_name: 'Rue' } }
            let(:second_messages) { { gender: 'M', last_name: 'Chandra' } }
            it_has_behavior 'returns the two in correct order'
          end
        end
      end

      context 'by last name descending' do
        let(:indexes) { { last_name: :desc } }
        context 'with only one record' do
          let(:messages) { %i(last_name) }
          it_has_behavior 'returns the single record'
        end
        context 'with two records' do
          let(:first_messages) { { last_name: 'Rue' } }
          let(:second_messages) { { last_name: 'Chandra' } }
          it_has_behavior 'returns the two in correct order'
        end
      end
    end
  end
end
