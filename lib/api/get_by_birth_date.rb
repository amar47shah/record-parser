module API
  class GetByBirthDate < Grape::API
    resource :records do
      get :birthdate do
        RecordParser::Sorting::ByBirthDate.new(API::Store.records).sort
      end
    end
  end
end
