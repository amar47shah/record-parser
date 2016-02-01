require 'api_spec_helper'
require 'support/helpers/rack_helper'
require 'support/matchers/eq_json'

module API
  module Endpoints
    describe GetSorted do
      shared_examples 'a sorting endpoint' do |indexes|
        let(:send_request) { get(path) }
        let(:records) { double('Records') }
        let(:sorter) { double('Sorter') }
        let(:sorted) { double('Sorted') }
        let(:sorted_json) { { sorted: 'json' }.to_json }
        before do
          allow(API::Store).to receive(:records).and_return(records)
          allow(
            RecordParser::Sorter
          ).to receive(:new).with(indexes).and_return(sorter)
          allow(sorter).to receive(:sort).and_return(sorted)
          allow(sorted).to receive(:to_json).and_return(sorted_json)
        end
        it 'sorts' do
          expect(sorter).to receive(:sort).with(records)
          send_request
        end
        it 'renders the sorted records as JSON' do
          send_request
          expect(last_response.body).to eq_json(sorted_json)
        end
      end

      describe 'GET /records/birthdate' do
        let(:path) { 'records/birthdate' }
        it_behaves_like 'a sorting endpoint', birth_date: :asc
      end

      describe 'GET /records/gender' do
        let(:path) { 'records/gender' }
        it_behaves_like 'a sorting endpoint', gender: :asc, last_name: :asc
      end

      describe 'GET /records/name' do
        let(:path) { 'records/name' }
        it_behaves_like 'a sorting endpoint', last_name: :desc
      end
    end
  end
end
