require 'grape'
require 'json'

require 'record_parser'
require 'api/get_by_birth_date'
require 'api/get_by_gender_and_last_name'
require 'api/get_by_last_name_descending'

module API
  class Base < Grape::API
    content_type :json, 'application/json'
    default_format :json
    mount API::GetByBirthDate
    mount API::GetByGenderAndLastName
    mount API::GetByLastNameDescending
  end
end
