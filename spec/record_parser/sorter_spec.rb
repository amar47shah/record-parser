require 'spec_helper'

module RecordParser
  describe Sorter do
    let(:sorter) { Sorter.new(records) }

    shared_examples 'returns the single record' do
      let(:records) { [record] }
      shared_examples 'returns the record' do
        it { is_expected.to eq([record]) }
      end
      context 'with record "Chandra"' do
        let(:record) { "Chandra" }
        it_has_behavior 'returns the record'
      end
      context 'with record "Rue"' do
        let(:record) { "Rue" }
        it_has_behavior 'returns the record'
      end
    end

    describe '#by_gender_and_last_name' do
      subject { sorter.by_gender_and_last_name }
      context 'with only one record' do
        it_has_behavior 'returns the single record'
      end
      context 'with two records, both masculine' do
        shared_examples 'returns records in last name ascending order' do
          it { is_expected.to eq(['Chandra Mick M', 'Robson Marcus M']) }
        end
        context 'out of order by last name ascending' do
          let(:records) { ['Robson Marcus M', 'Chandra Mick M'] }
          it_has_behavior 'returns records in last name ascending order'
        end
        context 'already in order by last name ascending' do
          let(:records) { ['Chandra Mick M', 'Robson Marcus M'] }
          it_has_behavior 'returns records in last name ascending order'
        end
      end
      context 'with two records, both feminine' do
        context 'out of order by last name ascending' do
          let(:records) { ['Rue Sandra F', 'Hart Gershwin F'] }
          it { is_expected.to eq(['Hart Gershwin F', 'Rue Sandra F']) }
        end
      end
      context 'with two records of different gender' do
        context 'with masculine first' do
          let(:records) { ['Chandra Mick M', 'Rue Sandra F'] }
          it { is_expected.to eq(['Rue Sandra F', 'Chandra Mick M']) }
        end
      end
    end

    describe '#by_last_name_descending' do
      subject { sorter.by_last_name_descending }
      context 'with only one record' do
        it_has_behavior 'returns the single record'
      end
      context 'with two records' do
        shared_examples 'returns records in last name descending order' do
          it { is_expected.to eq(['Rue', 'Chandra']) }
        end
        context 'with records "RueChandra"' do
          let(:records) { ['Rue', 'Chandra'] }
          it_has_behavior 'returns records in last name descending order'
        end
        context 'with records "ChandraRue"' do
          let(:records) { ['Chandra', 'Rue'] }
          it_has_behavior 'returns records in last name descending order'
        end
      end
    end
  end
end
