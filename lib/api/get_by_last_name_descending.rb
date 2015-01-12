require 'api/sort_helper'
require 'api/store_helper'

module API
  class GetByLastNameDescending < Grape::API
    helpers SortHelper
    helpers StoreHelper

    get :name do
      sort(records, :ByLastNameDescending)
    end
  end
end
