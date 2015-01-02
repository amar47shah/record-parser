module RecordParser
  class Application
    class << self
      undef_method :new

      def run(instruction, file, out)
        @instruction = instruction
        @file = file
        @out = out
        return unless sorting_class
        display(sorting_class.new(unsorted_records).sort)
      end

    private

      def camelcase_instruction
        @instruction.split('-').map(&:capitalize).join
      end

      def display(records)
        records.each { |record| @out.puts record }
      end

      def sorting_class
        Sorting.const_get(:"By#{camelcase_instruction}")
      rescue NameError
        @out.puts "Unrecognized instruction: #{@instruction}"
      end

      def unsorted_records
        @file.read.lines.map { |line| Record.new(line.chomp) }
      end
    end
  end
end
