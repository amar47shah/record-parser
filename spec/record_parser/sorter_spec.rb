require 'spec_helper'
require 'support/date_helper'

module RecordParser
  describe Sorter do
    let(:sorter) { Sorter.new(records) }

    def prepare(object, messages_and_values)
      messages_and_values.each do |message, value|
        allow(object).to receive(message).and_return(value)
      end
    end

    shared_examples 'returns the single record' do
      let(:only_record) { double('OnlyRecord') }
      let(:records) { [only_record] }
      before { messages.each { |m| allow(only_record).to receive(m) } }
      it { is_expected.to eq([only_record]) }
    end
    shared_examples 'returns the two in correct order' do
      let(:first) { double('FirstRecord') }
      let(:second) { double('SecondRecord') }
      let(:in_correct_order) { [first, second] }
      context 'when already in order' do
        let(:records) { in_correct_order }
        it { is_expected.to eq(in_correct_order) }
      end
      context 'when switched' do
        let(:records) { in_correct_order.reverse }
        it { is_expected.to eq(in_correct_order) }
      end
    end

    describe '#by_gender_and_last_name' do
      subject { sorter.by_gender_and_last_name }
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

    describe '#by_last_name_descending' do
      subject { sorter.by_last_name_descending }
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

    describe '#by_birth_date' do
      subject { sorter.by_birth_date }
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
