require 'rack/test'

module RackHelper
  include Rack::Test::Methods

  def app
    API::Base
  end
end

RSpec.configure do |config|
  config.include RackHelper
end
