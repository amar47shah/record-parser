require 'spec_helper'
require 'api'
require 'support/shared_examples/for_sorting_endpoints'

describe API::GetByBirthDate do
  it_behaves_like 'a sorting endpoint',
                  'records/birth_date',
                  RecordParser::Sorting::ByBirthDate
end
