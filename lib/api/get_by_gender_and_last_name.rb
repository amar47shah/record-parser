module API
  class GetByGenderAndLastName < Grape::API
    get :gender do
      RecordParser::Sorting::ByGenderAndLastName.new(API::Store.records).sort
    end
  end
end
