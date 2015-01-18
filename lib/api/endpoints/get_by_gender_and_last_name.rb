require 'grape'

require 'api/helpers/sort_helper'

module API
  module Endpoints
    class GetByGenderAndLastName < Grape::API
      helpers Helpers::SortHelper

      get :gender do
        sort_records(:ByGenderAndLastName)
      end
    end
  end
end
