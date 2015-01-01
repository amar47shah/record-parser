require 'spec_helper'
require 'support/date_helper'

module RecordParser
  describe Record do
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
        let(:record) { Record.new('Hart Gershwin F Blue 7/14/1984') }
        it { is_expected.to be_truthy }
      end
      context 'when masculine' do
        let(:record) { Record.new('Robson Marcus M Green 8/25/1989') }
        it { is_expected.to be_falsey }
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
