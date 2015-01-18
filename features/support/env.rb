require 'api'
require 'record_parser'
require 'rack/test'

module APIHelper
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
    attr_writer :bad, :lines, :name

    def readlines
      @bad and fail Errno::ENOENT, "@ rb_sysopen - #{@name}"
      @lines || []
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

World(APIHelper, CommandLineHelper, Rack::Test::Methods)
