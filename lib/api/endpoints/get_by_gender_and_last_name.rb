require 'api/helpers'

module API
  module Endpoints
    class GetByGenderAndLastName < Grape::API
      helpers Helpers::SortHelper
      helpers Helpers::StoreHelper

      get :gender do
        sort(records, :ByGenderAndLastName)
      end
    end
  end
end
