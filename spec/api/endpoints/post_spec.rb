require 'api_spec_helper'
require 'support/helpers/rack_helper'

module API
  module Endpoints
    describe Post do
      describe 'POST /records' do
        it 'adds the record' do
          expect(Store).to receive(:add).with('Record')
          post('/records', line: 'Record')
        end
      end
    end
  end
end
