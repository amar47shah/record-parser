require 'grape'

module API
  module Endpoints
    class Post < Grape::API
      post do
        Store.add(params[:line])
      end
    end
  end
end
