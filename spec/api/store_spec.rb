require 'api_spec_helper'

module API
  describe Store do
    describe '::add' do
      let(:add_record) { Store.add(line) }
      let(:file) { double('File') }
      let(:line) { double('Line') }
      before do
        Store.file = file
        allow(file).to receive(:puts)
        reader = double('Reader')
        allow(RecordParser::Reader).to receive(:new).and_return(reader)
        allow(reader).to receive(:records).and_return([])
        allow(RecordParser::Record).to receive(:new)
      end
      it 'adds record to store' do
        add_record
        expect(Store).to have_line(line)
      end
      it 'appends data line to file' do
        expect(file).to receive(:puts).with(line)
        add_record
      end
    end

    describe '::has_line?' do
      subject { Store.has_line?(line) }
      let(:line) { double('Line') }
      let(:record) { double('Record') }
      before do
        allow(RecordParser::Record).to receive(:new).and_return(record)
        allow(Store).to receive(:records).and_return(records)
      end
      context 'without the record in the store' do
        let(:records) { [] }
        it { is_expected.to be(false) }
      end
      context 'with the record in the store' do
        let(:records) { [record] }
        it { is_expected.to be(true) }
      end
    end

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
