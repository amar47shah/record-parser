require 'api_spec_helper'

module API
  describe Store do
    describe '::new' do
      subject { -> { Store.new } }
      it { is_expected.to raise_error(NoMethodError) }
    end

    describe '::records' do
      subject { Store.records }
      let(:file) { double('File') }
      let(:records) { double('Records') }
      let(:reader) { double('Reader') }
      before do
        Store.file = file
        allow(RecordParser::Reader).to receive(:new).and_return(reader)
      end
      context 'with original file' do
        context 'on initial access' do
          before { allow(reader).to receive(:records).and_return(records) }
          it { is_expected.to eq(records) }
        end
        context 'on subsequent access' do
          before { Store.records = records }
          it { is_expected.to eq(records) }
        end
      end
      context 'when file replaced' do
        let(:another_file) { double('AnotherFile') }
        let(:other_records) { double('OtherRecords') }
        before do
          Store.file = another_file
          allow(reader).to receive(:records).and_return(other_records)
        end
        it { is_expected.to eq(other_records) }
      end
    end
  end
end
