require 'json'

module API
  class GetByBirthDate < Grape::API
    resource :records do
      get :birth_date do
        RecordParser::Sorting::ByBirthDate.new(API::Store.records).sort.to_json
      end
    end
  end
end
