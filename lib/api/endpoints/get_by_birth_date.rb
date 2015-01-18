require 'grape'

require 'api/helpers/sort_helper'

module API
  module Endpoints
    class GetByBirthDate < Grape::API
      helpers Helpers::SortHelper

      get :birthdate do
        sort_records(:ByBirthDate)
      end
    end
  end
end
