$LOAD_PATH.unshift(File.expand_path('../../../spec/support/matchers', __FILE__))
require 'eq_json'

Given /^the API store contains$/ do |content|
  file.lines = content.lines
  API::Store.file = file
end

Given /^the API store is open$/ do
  API::Store.file = file
end

When /^the web client requests GET (.*)$/ do |path|
  get(path)
end

When /^the web client POSTs (.*)$/ do |line|
  post('/records', line: line)
end

Then /^the API store should contain (.*)$/ do |line|
  expect(API::Store).to have_line(line)
end

Then /^the response should be JSON:$/ do |data|
  expect(last_response.body).to eq_json(data)
end
