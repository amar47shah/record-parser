require 'record_parser'

World do
  CustomWorld.new
end

class CustomWorld
  def fake_file
    @fake_file ||= FakeFile.new
  end

  def fake_output
    @fake_output ||= FakeOutput.new
  end

  def session
    @session ||= RecordParser::Session.new(fake_output)
  end
end

class FakeFile
  attr_writer :contents
  attr_accessor :filename

  def read
    @contents
  end
end

class FakeOutput
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end
