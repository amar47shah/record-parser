Given /^I have input the records$/ do |records|
  fake_file.contents = records
  session.input(fake_file)
end

When /^My records are sorted$/ do
  session.show
end
