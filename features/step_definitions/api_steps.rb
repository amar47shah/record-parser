$LOAD_PATH.unshift(File.expand_path('../../../spec/support/matchers', __FILE__))
require 'eq_json'

Given /^the API store contains$/ do |contents|
  file.prepare_from(contents)
  API::Store.file = file
end

When /^the web client requests GET (.*)$/ do |path|
  get(path)
end

Then /^the response should be JSON:$/ do |data|
  expect(last_response.body).to eq_json(data)
end
