require 'spec_helper'

module RecordParser
  describe Reader do
    describe '#records' do
      shared_examples 'converts file to records' do
        subject { reader.records }
        let(:reader) { Reader.new(file) }
        let(:file) { double('File') }
        let(:records) { lines_and_records.values }
        let(:lines_and_records) do
          lines.reduce({ }) { |h, line| h[line] = double(line.chomp) ; h }
        end
        before do
          allow(file).to receive(:readlines).and_return(lines)
          lines_and_records.each do |line, record|
            allow(Record).to receive(:new).with(line.chomp).and_return(record)
          end
        end
        it { is_expected.to eq(records) }
      end
      context 'with empty file' do
        let(:lines) { [] }
        it_has_behavior 'converts file to records'
      end
      context 'with one-record file' do
        let(:lines) { ["Record\n"] }
        it_has_behavior 'converts file to records'
      end
      context 'with two-record file' do
        let(:lines) { ["RecordOne\n", "RecordTwo\n"] }
        it_has_behavior 'converts file to records'
      end
    end
  end
end
