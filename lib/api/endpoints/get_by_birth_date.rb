require 'api/helpers'

module API
  module Endpoints
    class GetByBirthDate < Grape::API
      helpers Helpers::SortHelper
      helpers Helpers::StoreHelper

      get :birthdate do
        sort(records, :ByBirthDate)
      end
    end
  end
end
