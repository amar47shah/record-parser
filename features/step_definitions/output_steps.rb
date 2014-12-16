Then /^I should see '(.*?)'$/ do |message|
  expect(fake_output.messages).to include(message)
end

Then /^I should see$/ do |paragraph|
  records = paragraph.split("\n")
  expect(fake_output.messages.each_cons(records.size)).to include(records)
end
