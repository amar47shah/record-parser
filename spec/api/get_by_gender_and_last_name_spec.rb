require 'api_spec_helper'
require 'support/shared_examples/for_sorting_endpoints'

module API
  describe GetByGenderAndLastName do
    it_behaves_like 'a sorting endpoint',
                    'records/gender',
                    RecordParser::Sorting::ByGenderAndLastName
  end
end
