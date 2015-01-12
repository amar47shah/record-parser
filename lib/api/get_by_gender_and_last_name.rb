require 'api/sort_helper'
require 'api/store_helper'

module API
  class GetByGenderAndLastName < Grape::API
    helpers SortHelper
    helpers StoreHelper

    get :gender do
      sort(records, :ByGenderAndLastName)
    end
  end
end
