Then /^I should see "(.*?)"$/ do |message|
  expect(out.messages).to include(message)
end

Then /^I should see$/ do |paragraph|
  lines = paragraph.split("\n")
  expect(out.messages.each_cons(lines.size)).to include(lines)
end
