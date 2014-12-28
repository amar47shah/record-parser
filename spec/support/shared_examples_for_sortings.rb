shared_context 'setup for sorting' do
  def expect_ordered_output(first, last)
    expect(out).to receive(:puts).with(first).ordered
    expect(out).to receive(:puts).with(last).ordered
  end
  let(:out) { double('Out') }
  let(:file) { double('File') }
  let(:sorting) { sorting_class.new(file, out) }
  before do
    allow(out).to receive(:puts)
    allow(file).to receive(:read)
    allow(file).to receive(:filename)
    allow(file).to receive(:read).and_return(contents)
  end
end

shared_examples 'displays heading and sorted records' do |show_method, heading, sort_method|
  it_has_behavior 'displays heading', show_method, heading
  it_has_behavior 'shows sorted records', show_method, sort_method
end

shared_examples 'displays heading' do |show_method, heading|
  let(:contents) { "Record\n" }
  it "displays a blank line before '#{heading}'" do
    expect_ordered_output('', heading)
    sorting.send(show_method)
  end
  it "displays '#{heading}' before the records" do
    expect_ordered_output(heading, 'Record')
    sorting.send(show_method)
  end
end

shared_examples 'shows sorted records' do |show_method, sort_method|
  let(:contents) { "Record One\nRecord Two\n" }
  let(:sorted) { unsorted.reverse }
  let(:sorter) { double('Sorter') }
  let(:unsorted) { contents.lines.map(&:chomp) }
  before do
    allow(RecordParser::Sorter).to receive(:new).
                                   with(unsorted).
                                   and_return(sorter)
    allow(sorter).to receive(sort_method).and_return(sorted)
  end
  it 'displays the sorted records' do
    expect_ordered_output(*sorted)
    sorting.send(show_method)
  end
end
