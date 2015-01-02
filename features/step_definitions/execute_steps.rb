When /^I run the application$/ do
  RecordParser::Application.run(@instruction, file, out)
end
