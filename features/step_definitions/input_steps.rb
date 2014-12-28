Given /^I have chosen to sort by gender and last name$/ do
  sorting = RecordParser::Sorting::ByGenderAndLastName.new(fake_output)
end

Given /^I have chosen to sort by last name descending$/ do
  sorting = RecordParser::Sorting::ByLastNameDescending.new(fake_output)
end

Given /^I have input the records$/ do |records|
  fake_file.contents = records
  sorting.input(fake_file)
end
