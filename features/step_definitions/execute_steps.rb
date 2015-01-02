When /^I run the application$/ do
  RecordParser::CommandLineInterface.new(out).run(@instruction, file)
end
