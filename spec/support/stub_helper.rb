module StubHelper
  def prepare(object, messages_and_values)
    messages_and_values.each do |message, value|
      allow(object).to receive(message).and_return(value)
    end
  end
end

RSpec.configure do |config|
  config.include StubHelper
end
