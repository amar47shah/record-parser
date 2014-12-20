Given /^I have input the records$/ do |records|
  fake_file.contents = records
  session.input(fake_file)
end

When /^I choose "Sort by gender and last name."$/ do
  session.show_by_gender_and_last_name
end

When /^I choose "Sort by last name descending."$/ do
  session.show_by_last_name_descending
end
