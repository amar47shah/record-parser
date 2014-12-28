module RecordParser
  class Sorting
    def initialize(out)
      @out = out
      puts 'Welcome to the Record Parser'
    end

    def input(file)
      puts "Parsing #{file.filename}"
      @contents = file.read
    end

    def show_by_gender_and_last_name
      display_heading('Sorted by gender and last name:')
      display_records(Sorter.new(records).records_by_gender_and_last_name)
    end

    def show_by_last_name_descending
      display_heading('Sorted by last name descending:')
      display_records(Sorter.new(records).records_by_last_name_descending)
    end

  private

    def display_heading(heading)
      puts '', heading
    end

    def display_records(records)
      puts *records
    end

    def puts(*lines)
      lines.each { |line| @out.puts line.chomp }
    end

    def records
      @contents.lines.map(&:chomp)
    end
  end
end
