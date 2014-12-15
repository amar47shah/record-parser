Then /^I should see '(.*?)'$/ do |message|
  expect(fake_output.messages).to include(message)
end
