Given /^I have chosen to sort by gender and last name:$/ do |records|
  prepare_file(records)
  @sorting = RecordParser::Sorting::ByGenderAndLastName.new(file, out)
end

Given /^I have chosen to sort by last name descending:$/ do |records|
  prepare_file(records)
  @sorting = RecordParser::Sorting::ByLastNameDescending.new(file, out)
end

Given /^I have chosen to sort by birth date:$/ do |records|
  prepare_file(records)
  @sorting = RecordParser::Sorting::ByBirthDate.new(file, out)
end

Given /^I have chosen the bad sorting instruction "(.*?)"$/ do |bad_instruction|
  @instruction = bad_instruction
end
