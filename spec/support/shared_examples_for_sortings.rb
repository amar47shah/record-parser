shared_examples 'shows sorted records' do
  let(:out) { double('Out') }
  let(:file) { double('File') }
  let(:sorting) { sorting_class.new(file, out) }
  let(:contents) { "Record One\nRecord Two\n" }
  let(:sorted) { unsorted.reverse }
  let(:unsorted) { contents.lines.map(&:chomp) }
  before do
    sorter = double('Sorter')
    allow(out).to receive(:puts)
    allow(file).to receive(:read).and_return(contents)
    allow(RecordParser::Sorter).to receive(:new).
                                   with(unsorted).
                                   and_return(sorter)
    allow(sorter).to receive(sort_method).and_return(sorted)
  end
  it 'displays the sorted records' do
    expect(out).to receive(:puts).with(sorted.first).ordered
    expect(out).to receive(:puts).with(sorted.last).ordered
    sorting.show
  end
end
