module API
  class GetByGenderAndLastName < Grape::API
    resource :records do
      get :gender do
        RecordParser::Sorting::ByGenderAndLastName.new(API::Store.records).sort
      end
    end
  end
end
