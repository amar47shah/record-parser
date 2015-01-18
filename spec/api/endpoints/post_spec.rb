require 'api_spec_helper'
require 'support/helpers/rack_helper'

module API
  module Endpoints
    describe Post do
      describe 'POST /records' do
        before { post('/records', line: nil) }
        subject { last_response.status }
        it { is_expected.to eq(201) }
      end
    end
  end
end
