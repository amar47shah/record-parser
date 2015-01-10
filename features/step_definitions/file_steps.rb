Given /^I have chosen the non\-existent file "(.*?)"$/ do |bad_filename|
  file.bad = true
  file.name = bad_filename
end

Given /^my files contain$/ do |contents|
  file.contents = contents
end

Given /^the API store contains$/ do |contents|
  file.contents = contents
  API::Store.file = file
end
