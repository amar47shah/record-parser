When /^I run the application$/ do
  RecordParser::Application.new(out).run(@instruction, file)
end
