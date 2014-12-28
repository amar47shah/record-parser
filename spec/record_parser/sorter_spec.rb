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
        context 'with "Rue" followed by "Chandra"' do
          let(:records) { ['Rue', 'Chandra'] }
          it_has_behavior 'returns records in last name descending order'
        end
        context 'with "Chandra" followed by "Rue"' do
          let(:records) { ['Chandra', 'Rue'] }
          it_has_behavior 'returns records in last name descending order'
        end
      end
    end

    describe '#by_birth_date' do
      subject { sorter.by_birth_date }
      context 'with only one record' do
        it_has_behavior 'returns the single record'
      end
      context 'with two records' do
        shared_examples 'returns the two in correct order' do
          context 'when already in order' do
            let(:records) { in_correct_order }
            it { is_expected.to eq(in_correct_order) }
          end
          context 'when switched' do
            let(:records) { in_correct_order.reverse }
            it { is_expected.to eq(in_correct_order) }
          end
        end
        context 'with different birth years' do
          let(:in_correct_order) do
            ['Chandra Mick M Red 9/14/1953',
             'Baczyk Bran M Yellow 9/14/1984']
          end
          it_has_behavior 'returns the two in correct order'
        end
        context 'with the same birth year' do
          context 'and same birth month' do
            let(:in_correct_order) do
              ['Robson Fenley F Purple 7/4/1984',
               'Hart Gershwin F Blue 7/14/1984']
            end
            it_has_behavior 'returns the two in correct order'
          end
          context 'and different birth months' do
            context 'and same birth day of month' do
              let(:in_correct_order) do
                ['Hart Gershwin F Blue 7/14/1984',
                 'Baczyk Bran M Yellow 9/14/1984']
              end
              it_has_behavior 'returns the two in correct order'
            end
            context 'and different birth day of month' do
              let(:in_correct_order) do
                ['Hart Gershwin F Blue 7/14/1984',
                 'al-Nouri Sami F Black 12/1/1984']
              end
              it_has_behavior 'returns the two in correct order'
            end
          end
        end
      end
      context 'with three records' do
        let(:in_correct_order) do
          ['Chandra Mick M Red 9/14/1953',
           'Robson Fenley F Purple 7/4/1984',
           'Hart Gershwin F Blue 7/14/1984']
        end
        context 'out of order' do
          let(:records) do
          ['Robson Fenley F Purple 7/4/1984',
           'Chandra Mick M Red 9/14/1953',
           'Hart Gershwin F Blue 7/14/1984']
          end
          it { is_expected.to eq(in_correct_order) }
        end
      end
    end
  end
end
