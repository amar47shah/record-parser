Given /^I have chosen to sort by gender and last name$/ do
  @instruction = 'gender-and-last-name'
end

Given /^I have chosen to sort by last name descending$/ do
  @instruction = 'last-name-descending'
end

Given /^I have chosen to sort by birth date$/ do
  @instruction = 'birth-date'
end

Given /^I have chosen the bad sorting instruction "(.*?)"$/ do |bad_instruction|
  @instruction = bad_instruction
end

Given /^my file contains$/ do |contents|
  file.contents = contents
end
