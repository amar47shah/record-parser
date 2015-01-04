Given /^I have chosen the bad sorting instruction "(.*?)"$/ do |bad_instruction|
  @instruction = bad_instruction
end

Given /^I have chosen to sort by birth date$/ do
  @instruction = 'birth-date'
end

Given /^I have chosen to sort by gender and last name$/ do
  @instruction = 'gender-and-last-name'
end

Given /^I have chosen to sort by last name descending$/ do
  @instruction = 'last-name-descending'
end

When /^I run the application$/ do
  RecordParser::CommandLineInterface.new(out).run(@instruction, file)
end

Then /^I should see "(.*?)"$/ do |message|
  expect(out.messages).to include(message)
end

Then /^I should see$/ do |paragraph|
  lines = paragraph.split("\n")
  expect(out.messages.each_cons(lines.size)).to include(lines)
end
