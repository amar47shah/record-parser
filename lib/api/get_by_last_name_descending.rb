module API
  class GetByLastNameDescending < Grape::API
    resource :records do
      get :name do
        RecordParser::Sorting::ByLastNameDescending.new(API::Store.records).sort
      end
    end
  end
end
