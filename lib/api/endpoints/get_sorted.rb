require 'grape'

require 'api/helpers/sort_helper'

module API
  module Endpoints
    class GetSorted < Grape::API
      helpers Helpers::SortHelper

      get :birthdate do
        sort_records birth_date: :asc
      end

      get :gender do
        sort_records gender: :asc, last_name: :asc
      end

      get :name do
        sort_records last_name: :desc
      end
    end
  end
end
