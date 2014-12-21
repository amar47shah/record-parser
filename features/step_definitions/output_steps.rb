Then /^I should see '(.*?)'$/ do |message|
  expect(fake_output.messages).to include(message)
end

Then /^I should see$/ do |paragraph|
  lines = paragraph.split("\n")
  expect(fake_output.messages.each_cons(lines.size)).to include(lines)
end
