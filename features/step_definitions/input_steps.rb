Given /^I have chosen to sort by gender and last name:$/ do |records|
  prepare_file(records)
  sorting = RecordParser::Sorting::ByGenderAndLastName.new(file, out)
end

Given /^I have chosen to sort by last name descending:$/ do |records|
  prepare_file(records)
  sorting = RecordParser::Sorting::ByLastNameDescending.new(file, out)
end
