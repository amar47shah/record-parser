Given /^I have not started a session$/ do
end

When /^I start a session$/ do
  @session = RecordParser::Session.new(fake_output)
end

When /^I input a file called 'data\/records\.txt'$/ do
  fake_file.name = 'data/records.txt'
  @session.input(fake_file)
end
