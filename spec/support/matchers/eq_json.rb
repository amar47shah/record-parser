require 'rspec/expectations'
require 'json'

RSpec::Matchers.define :eq_json do |expected|
  match do |actual|
    JSON.parse(actual) == JSON.parse(expected)
  end
end
