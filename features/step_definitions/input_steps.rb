Given /^I have not started the sorter$/ do
end

When /^I input a file called 'data\/records\.txt'$/ do
  fake_file.filename = 'data/records.txt'
  sorting.input(fake_file)
end

When /^I choose to sort by gender and last name$/ do
  pending
end

When /^I choose to sort by last name descending$/ do
  pending
end
