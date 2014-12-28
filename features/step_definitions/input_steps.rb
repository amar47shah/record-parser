Given /^I have chosen to sort by gender and last name:$/ do |records|
  prepare_fake_file(records)
  sorting = RecordParser::Sorting::ByGenderAndLastName.new(fake_output,
                                                           fake_file)
end

Given /^I have chosen to sort by last name descending:$/ do |records|
  prepare_fake_file(records)
  sorting = RecordParser::Sorting::ByLastNameDescending.new(fake_output,
                                                            fake_file)
end
