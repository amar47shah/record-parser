Given /^I have input the records$/ do |records|
  fake_file.contents = records
  session.input(fake_file)
end

Given /^I have chosen to sort by gender and last name$/ do
  pending
end

Given /^I have chosen to sort by last name descending$/ do
  pending
end

When /^I view the sorted records$/ do
  pending
end
