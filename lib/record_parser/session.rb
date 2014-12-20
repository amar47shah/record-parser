module RecordParser
  class Session
    def initialize(out)
      @out = out
      @out.puts 'Welcome to the Record Parser'
    end

    def input(file)
      @out.puts "Parsing #{file.filename}"
      @contents = file.read
    end

    def show_by_gender_and_last_name
    end

    def show_by_last_name_descending
      @contents.lines.sort.reverse_each { |line| @out.puts line.chomp }
    end
  end
end
