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
end

class FakeFile
  attr_writer :bad, :contents, :name

  def read
    fail Errno::ENOENT, "@ rb_sysopen - #{@name}" if @bad
    @contents
  end
end

class FakeOutput
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << "#{message}" && nil
  end
end
