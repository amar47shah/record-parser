module API
  class GetByBirthDate < Grape::API
    resource :records do
      get :birth_date do
        RecordParser::Sorting::ByBirthDate.new(API::Store.records).sort
      end
    end
  end
end
