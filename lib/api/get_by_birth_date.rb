require 'api/sort_helper'
require 'api/store_helper'

module API
  class GetByBirthDate < Grape::API
    helpers SortHelper
    helpers StoreHelper

    get :birthdate do
      sort(records, :ByBirthDate)
    end
  end
end
