require 'spec_helper'
require 'rack/test'
require 'api'
require 'support/matchers/eq_json'

describe API::GetByBirthDate do
  include Rack::Test::Methods

  def app
    API::Base
  end

  describe 'GET /records/birth_date' do
    let(:send_request) { get 'records/birth_date' }
    let(:records) { double('Records') }
    let(:sorting) { double('Sorting') }
    let(:sorted) { double('Sorted') }
    let(:sorted_json) { { sorted: 'json' }.to_json }
    before do
      allow(API::Store).to receive(:records).and_return(records)
      allow(RecordParser::Sorting::ByBirthDate).to receive(:new).
                                                   and_return(sorting)
      allow(sorting).to receive(:sort).and_return(sorted)
      allow(sorted).to receive(:to_json).and_return(sorted_json)
    end
    it 'instantiates a sorting by birth date' do
      expect(RecordParser::Sorting::ByBirthDate).to receive(:new).with(records)
      send_request
    end
    it 'sorts' do
      expect(sorting).to receive(:sort)
      send_request
    end
    it 'renders the sorted records as JSON' do
      send_request
      expect(last_response.body).to eq_json(sorted_json)
    end
  end
end
