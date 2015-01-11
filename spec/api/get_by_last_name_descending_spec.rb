require 'api_spec_helper'
require 'support/shared_examples/for_sorting_endpoints'

module API
  describe GetByLastNameDescending do
    it_behaves_like 'a sorting endpoint',
                    'records/name',
                    RecordParser::Sorting::ByLastNameDescending
  end
end
