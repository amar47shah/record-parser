Given /^the API store contains$/ do |contents|
  file.prepare_from(contents)
  API::Store.file = file
end

When /^the web client requests GET (.*)$/ do |path|
  get(path)
end

Then /^the response should be JSON:$/ do |json|
  expect(JSON.parse(last_response.body)).to eq(JSON.parse(json))
end
