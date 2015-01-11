require 'api/store_helper'

module API
  class GetByBirthDate < Grape::API
    helpers StoreHelper

    get :birthdate do
      RecordParser::Sorting::ByBirthDate.new(records).sort
    end
  end
end
