shared_examples 'sorts records' do |sort_method|
  let(:file) { double('File') }
  let(:sorting) { sorting_class.new(file) }
  let(:record_one) { double('RecordOne') }
  let(:record_two) { double('RecordTwo') }
  let(:unsorted) { [record_one, record_two] }
  let(:sorted) { unsorted.reverse }
  before do
    allow(file).to receive(:read).and_return("RecordOne\nRecordTwo\n")
    allow(RecordParser::Record).to receive(:new).
                                   with('RecordOne').
                                   and_return(record_one)
    allow(RecordParser::Record).to receive(:new).
                                   with('RecordTwo').
                                   and_return(record_two)
    sorter = double('Sorter')
    allow(RecordParser::Sorter).to receive(:new).
                                   with(unsorted).
                                   and_return(sorter)
    allow(sorter).to receive(sort_method).and_return(sorted)
  end
  it "sorts the records #{"#{sort_method}".gsub('_', ' ')}" do
    expect(sorting.sort).to eq(sorted)
  end
end
