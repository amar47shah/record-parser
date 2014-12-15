class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def fake_output
  @fake_output ||= Output.new
end

Then /^I should see '(.*?)'$/ do |message|
  expect(fake_output.messages).to include(message)
end
