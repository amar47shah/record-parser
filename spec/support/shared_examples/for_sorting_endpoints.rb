require 'support/helpers/rack_helper'
require 'support/matchers/eq_json'

shared_examples 'a sorting endpoint' do |path, sorting_class|
  describe "GET /#{path}" do
    let(:send_request) { get(path) }
    let(:records) { double('Records') }
    let(:sorting) { double('Sorting') }
    let(:sorted) { double('Sorted') }
    let(:sorted_json) { { sorted: 'json' }.to_json }
    before do
      allow(API::Store).to receive(:records).and_return(records)
      allow(sorting_class).to receive(:new).and_return(sorting)
      allow(sorting).to receive(:sort).and_return(sorted)
      allow(sorted).to receive(:to_json).and_return(sorted_json)
    end
    it 'sorts' do
      expect(sorting).to receive(:sort).with(records)
      send_request
    end
    it 'renders the sorted records as JSON' do
      send_request
      expect(last_response.body).to eq_json(sorted_json)
    end
  end
end
