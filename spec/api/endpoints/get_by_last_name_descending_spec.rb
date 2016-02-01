require 'api_spec_helper'
require 'support/shared_examples/for_sorting_endpoints'

module API
  module Endpoints
    describe GetByLastNameDescending do
      it_behaves_like 'a sorting endpoint',
                      'records/name',
                      last_name: :desc
    end
  end
end
