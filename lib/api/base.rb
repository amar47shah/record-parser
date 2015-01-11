require 'grape'

require 'record_parser'
require 'api/get_by_birth_date'

module API
  class Base < Grape::API
    mount API::GetByBirthDate
  end
end
