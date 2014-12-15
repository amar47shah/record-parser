Given /^I have not started a session$/ do
end

When /^I start a session$/ do
  @session = RecordParser::Session.new(fake_output)
end

When /^I input a file called 'data\/records\.txt'$/ do
  @session.input('data/records.txt')
end
