require 'record_parser'

World do
  CustomWorld.new
end

class CustomWorld
  def file
    @file ||= FakeFile.new
  end

  def out
    @out ||= FakeOutput.new
  end

  def prepare_file(records)
    file.records = records
  end
end

class FakeFile
  attr_writer :records

  def read
    @records
  end
end

class FakeOutput
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << "#{message}"
  end
end
