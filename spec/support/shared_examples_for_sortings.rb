shared_examples 'returns the single record' do
  let(:only_record) { double('OnlyRecord') }
  let(:records) { [only_record] }
  before { messages.each { |m| allow(only_record).to receive(m) } }
  it { is_expected.to eq([only_record]) }
end

shared_examples 'returns the two in correct order' do
  let(:first) { double('FirstRecord') }
  let(:second) { double('SecondRecord') }
  let(:in_correct_order) { [first, second] }
  context 'when already in order' do
    let(:records) { in_correct_order }
    it { is_expected.to eq(in_correct_order) }
  end
  context 'when switched' do
    let(:records) { in_correct_order.reverse }
    it { is_expected.to eq(in_correct_order) }
  end
end
