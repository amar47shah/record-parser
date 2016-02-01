require 'grape'
require 'json'

require 'api/endpoints'

module API
  class Base < Grape::API
    content_type :json, 'application/json'
    default_format :json
    resource :records do
      mount API::Endpoints::GetSorted
      mount API::Endpoints::Post
    end
  end
end
