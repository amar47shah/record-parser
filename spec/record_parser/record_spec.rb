require 'spec_helper'
require 'support/helpers/date_helper'
require 'support/helpers/json_helper'
require 'support/matchers/eq_json'

module RecordParser
  describe Record do
    describe '#==' do
      subject { record == another_record }
      let(:another_record) { Record.new('Nagamura Leandra F Blue 6/4/1980') }
      context 'with record from same fields' do
        context 'delimited the same' do
          let(:record) { Record.new('Nagamura Leandra F Blue 6/4/1980') }
          it { is_expected.to be(true) }
        end
        context 'delimited differently' do
          let(:record) { Record.new('Nagamura, Leandra, F, Blue, 6/4/1980') }
          it { is_expected.to be(true) }
        end
      end
      context 'with record from different fields' do
        let(:record) { Record.new('Velez Tobyn F Green 7/14/1984') }
        it { is_expected.to be(false) }
      end
    end

    describe '#birth_date' do
      subject { record.birth_date }
      context 'when "9/14/1953"' do
        let(:record) { Record.new('Chandra Mick M Red 9/14/1953') }
        it { is_expected.to eq(date_from('9/14/1953')) }
      end
      context 'when "12/1/1984"' do
        let(:record) { Record.new('Alnouri Sami F Black 12/1/1984') }
        it { is_expected.to eq(date_from('12/1/1984')) }
      end
    end

    describe '#feminine?' do
      subject { record.feminine? }
      context 'when feminine' do
        context 'with space-delimited input' do
          let(:record) { Record.new('Hart Gershwin F Blue 7/14/1984') }
          it { is_expected.to be(true) }
        end
        context 'with comma-delimited input' do
          let(:record) { Record.new('Hart, Gershwin, F, Blue, 7/14/1984') }
          it { is_expected.to be(true) }
        end
        context 'with pipe-delimited input' do
          let(:record) { Record.new('Hart | Gershwin | F | Blue | 7/14/1984') }
          it { is_expected.to be(true) }
        end
      end
      context 'when masculine' do
        let(:record) { Record.new('Robson Marcus M Green 8/25/1989') }
        it { is_expected.to be(false) }
      end
    end

    describe '#last_name' do
      subject { record.last_name }
      context 'when "Baczyk"' do
        let(:record) { Record.new('Baczyk Bran M Yellow 9/14/1984') }
        it { is_expected.to eq('Baczyk') }
      end
      context 'when "Rue"' do
        context 'with space-delimited input' do
          let(:record) { Record.new('Rue Sandra F Blue 12/1/1977') }
          it { is_expected.to eq('Rue') }
        end
        context 'with comma-delimited input' do
          let(:record) { Record.new('Rue, Sandra, F, Blue, 12/1/1977') }
          it { is_expected.to eq('Rue') }
        end
      end
    end

    describe '#to_json' do
      describe 'single record' do
        shared_examples 'returns data as json' do |input|
          subject { record.to_json }
          context "when #{input}" do
            let(:record) { Record.new(input) }
            it { is_expected.to eq_json(for_record_from(input)) }
          end
        end
        it_has_behavior 'returns data as json',
                        'Baczyk Bran M Yellow 9/14/1984'
        it_has_behavior 'returns data as json',
                        'Alnouri Sami F Black 12/1/1984'
      end
      describe 'collection of records' do
        subject { records.to_json }
        let(:records) { inputs.map { |input| Record.new(input) } }
        let(:inputs) do
          ['Baczyk Bran M Yellow 9/14/1984', 'Alnouri Sami F Black 12/1/1984']
        end
        it 'serializes an array of records' do
          is_expected.to eq_json(for_records_from(inputs))
        end
      end
    end

    describe '#to_s' do
      shared_examples 'returns data inline and space-delimited' do |input|
        subject { "#{record}" }
        context "when '#{input}'" do
          let(:record) { Record.new(input) }
          it { is_expected.to eq(input.delete(',|').squeeze(' ')) }
        end
      end
      it_has_behavior 'returns data inline and space-delimited',
                      'Chandra Mick M Red 9/14/1953'
      it_has_behavior 'returns data inline and space-delimited',
                      'Robson Fenley F Purple 7/4/1984'
      it_has_behavior 'returns data inline and space-delimited',
                      'Robson, Fenley, F, Purple, 7/4/1984'
      it_has_behavior 'returns data inline and space-delimited',
                      'Robson | Fenley | F | Purple | 7/4/1984'
    end
  end
end
