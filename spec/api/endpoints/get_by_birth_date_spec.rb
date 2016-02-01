require 'api_spec_helper'
require 'support/shared_examples/for_sorting_endpoints'

module API
  module Endpoints
    describe GetByBirthDate do
      it_behaves_like 'a sorting endpoint',
                      'records/birthdate',
                      birth_date: :asc
    end
  end
end
