module StubHelper
  def prepare(object, messages_and_values)
    allow(object).to receive_messages(messages_and_values)
  end
end

RSpec.configure do |config|
  config.include StubHelper
end
