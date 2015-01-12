require 'api'
require 'record_parser'
require 'rack/test'

module WebHelper
  def app
    API::Base
  end
end

module CommandLineHelper
  def file
    @file ||= FakeFile.new
  end

  def out
    @out ||= FakeOutput.new
  end

  class FakeFile
    attr_writer :bad, :contents, :name

    def readlines
      @bad and fail Errno::ENOENT, "@ rb_sysopen - #{@name}"
      (@contents || '').lines
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
end

World(CommandLineHelper, Rack::Test::Methods, WebHelper)
