require 'grape'
require 'json'

require 'record_parser'
require 'api/get_by_birth_date'

module API
  class Base < Grape::API
    content_type :json, 'application/json'
    default_format :json
    mount API::GetByBirthDate
  end
end
