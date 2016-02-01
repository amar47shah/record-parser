require 'grape'

require 'api/helpers/sort_helper'

module API
  module Endpoints
    class GetByLastNameDescending < Grape::API
      helpers Helpers::SortHelper

      get :name do
        sort_records last_name: :desc
      end
    end
  end
end
