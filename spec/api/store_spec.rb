require 'api_spec_helper'

module API
  describe Store do
    let(:file) { double('File') }
    before { Store.file = file }

    describe '::new' do
      subject { -> { Store.new } }
      it { is_expected.to raise_error(NoMethodError) }
    end

    describe '::records' do
      subject { Store.records }
      let(:records) { double('FileRecords') }
      context 'on initial access' do
        before do
          Store.records = nil
          reader = double('Reader')
          allow(RecordParser::Reader).to receive(:new).
                                         with(file).
                                         and_return(reader)
          allow(reader).to receive(:records).and_return(records)
        end
        it { is_expected.to eq(records) }
      end
      context 'on subsequent access' do
        before { Store.records = records }
        it { is_expected.to eq(records) }
      end
    end
  end
end
