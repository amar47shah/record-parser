require 'record_parser'

RSpec.configure do |config|
  config.alias_it_should_behave_like_to :it_has_behavior, 'has behavior:'
end

class RSpec::Mocks::Double
  def inspect
    @name
  end
end
