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

Given /^I have not started a session$/  do
end

When /^I start a session with a file called 'data\/records\.txt'$/  do
  RecordParser::Session.new('data/records.txt', fake_output)
end

Then /^I should see 'Welcome to the Record Parser'$/  do
  expect(fake_output.messages).to include('Welcome to the Record Parser')
end

Then /^I should see 'Parsing data\/records\.txt'$/  do
  expect(fake_output.messages).to include('Parsing data/records.txt')
end
