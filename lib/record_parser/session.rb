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
      display_heading('Sorted by gender and last name:')
      gender_sets.each { |set| set.sort.each { |line| puts line } }
    end

    def show_by_last_name_descending
      display_heading('Sorted by last name descending:')
      lines.sort.reverse_each { |line| puts line }
    end

  private

    def display_heading(heading)
      ['', heading].each { |line| puts line }
    end

    def gender_sets
      lines.partition { |l| l.split(' ')[2] == 'F' }
    end

    def lines
      @contents.lines
    end

    def puts(line)
      @out.puts line.chomp
    end
  end
end
