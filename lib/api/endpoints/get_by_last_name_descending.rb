require 'grape'

require 'api/helpers'

module API
  module Endpoints
    class GetByLastNameDescending < Grape::API
      helpers Helpers::SortHelper
      helpers Helpers::StoreHelper

      get :name do
        sort(records, :ByLastNameDescending)
      end
    end
  end
end
