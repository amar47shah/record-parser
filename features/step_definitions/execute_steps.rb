When /^I run the application$/ do
  RecordParser::Application.run(@instruction, file, out)
end

When /^my records are sorted$/ do
  @sorting.show
end
