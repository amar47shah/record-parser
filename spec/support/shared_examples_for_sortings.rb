shared_examples 'shows sorted records' do |sort_method|
  let(:out) { double('Out') }
  let(:file) { double('File') }
  let(:sorting) { sorting_class.new(file, out) }
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
  it "displays the records sorted #{"#{sort_method}".gsub('_', ' ')}" do
    expect(out).to receive(:puts).with(sorted.first).ordered
    expect(out).to receive(:puts).with(sorted.last).ordered
    sorting.show
  end
end
