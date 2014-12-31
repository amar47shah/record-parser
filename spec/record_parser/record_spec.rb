require 'spec_helper'

module RecordParser
  describe Record do
    describe '#birth_date' do
      subject { record.birth_date }
      def date_from(string)
        Date.strptime(string, '%m/%d/%Y')
      end
      context 'when "9/14/1953"' do
        let(:record) { Record.new('Chandra Mick M Red 9/14/1953') }
        it { is_expected.to eq(date_from('9/14/1953')) }
      end
      context 'when "12/1/1984"' do
        let(:record) { Record.new('Alnouri Sami F Black 12/1/1984') }
        it { is_expected.to eq(date_from('12/1/1984')) }
      end
    end

    describe '#gender' do
      subject { record.gender }
      context 'when feminine' do
        let(:record) { Record.new('Hart Gershwin F Blue 7/14/1984') }
        it { is_expected.to eq('F') }
      end
      context 'when masculine' do
        let(:record) { Record.new('Robson Marcus M Green 8/25/1989') }
        it { is_expected.to eq('M') }
      end
    end

    describe '#last_name' do
      subject { record.last_name }
      context 'when "Baczyk"' do
        let(:record) { Record.new('Baczyk Bran M Yellow 9/14/1984') }
        it { is_expected.to eq('Baczyk') }
      end
      context 'when "Rue"' do
        let(:record) { Record.new('Rue Sandra F Blue 12/1/1977') }
        it { is_expected.to eq('Rue') }
      end
    end

    describe '#to_s' do
      subject { "#{record}" }
      context 'when "Chandra Mick M Red 9/14/1953"' do
        let(:record) { Record.new('Chandra Mick M Red 9/14/1953') }
        it { is_expected.to eq('Chandra Mick M Red 9/14/1953') }
      end
      context 'when "Robson Fenley F Purple 7/4/1984"' do
        let(:record) { Record.new('Robson Fenley F Purple 7/4/1984') }
        it { is_expected.to eq('Robson Fenley F Purple 7/4/1984') }
      end
    end
  end
end
