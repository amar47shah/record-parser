require 'api/store_helper'

module API
  class GetByGenderAndLastName < Grape::API
    helpers StoreHelper

    get :gender do
      RecordParser::Sorting::ByGenderAndLastName.new(records).sort
    end
  end
end
