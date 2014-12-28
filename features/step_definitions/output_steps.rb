Then /^I should see$/ do |paragraph|
  lines = paragraph.split("\n")
  expect(out.messages.each_cons(lines.size)).to include(lines)
end
