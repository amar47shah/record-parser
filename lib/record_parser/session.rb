module RecordParser
  class Session
    def initialize(out)
      @out = out
      @out.puts 'Welcome to the Record Parser'
    end

    def input(file)
      @out.puts "Parsing #{file}"
    end
  end
end
