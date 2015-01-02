shared_examples 'sorts records' do |sort_method|
  let(:sorting) { sorting_class.new(unsorted) }
  let(:unsorted) { [record_one, record_two] }
  let(:record_one) { double('RecordOne') }
  let(:record_two) { double('RecordTwo') }
  let(:sorted) { unsorted.reverse }
  before do
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
