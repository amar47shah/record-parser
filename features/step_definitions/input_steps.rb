Given /^I have not started a session$/ do
end

When /^I start a session$/ do
  session
end

When /^I input a file called 'data\/records\.txt'$/ do
  fake_file.filename = 'data/records.txt'
  session.input(fake_file)
end
