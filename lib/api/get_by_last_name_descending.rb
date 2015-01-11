require 'api/store_helper'

module API
  class GetByLastNameDescending < Grape::API
    helpers StoreHelper

    get :name do
      RecordParser::Sorting::ByLastNameDescending.new(records).sort
    end
  end
end
