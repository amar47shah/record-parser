require 'grape'
require 'json'

require 'record_parser'
require 'api/endpoints'

module API
  class Base < Grape::API
    content_type :json, 'application/json'
    default_format :json
    resource :records do
      mount API::Endpoints::GetByBirthDate
      mount API::Endpoints::GetByGenderAndLastName
      mount API::Endpoints::GetByLastNameDescending
    end
  end
end
