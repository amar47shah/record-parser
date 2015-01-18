require 'grape'

module API
  module Endpoints
    class Post < Grape::API
      post { Store.add(params[:line]) }
    end
  end
end
