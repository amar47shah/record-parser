require 'grape'

require 'api/helpers/create_helper'

module API
  module Endpoints
    class Post < Grape::API
      helpers Helpers::CreateHelper

      post do
        create_record_from(params[:line])
      end
    end
  end
end
