class FakeFile
  attr_accessor :contents
  attr_writer :name

  def read
    @contents
  end

  def filename
    @name
  end
end

def fake_file
  @fake_file ||= FakeFile.new
end

def session
  @session ||= RecordParser::Session.new(fake_output)
end

Given /^I have input the records$/ do |records|
  fake_file.contents = records
  session.input(fake_file)
end

When /^My records are sorted$/ do
  session.show
end
