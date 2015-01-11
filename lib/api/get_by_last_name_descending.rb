module API
  class GetByLastNameDescending < Grape::API
    get :name do
      RecordParser::Sorting::ByLastNameDescending.new(API::Store.records).sort
    end
  end
end
