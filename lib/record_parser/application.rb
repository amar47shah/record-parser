module RecordParser
  class Application
    class << self
      undef_method :new

      def run(instruction, file, out)
        @instruction = instruction
        @out = out
        return unless sorting_class
        sorting_class.new(file).sort.each { |record| @out.puts record }
      end

    private

      def camelcase_instruction
        @instruction.split('-').map(&:capitalize).join
      end

      def sorting_class
        Sorting.const_get(:"By#{camelcase_instruction}")
      rescue NameError
        @out.puts "Unrecognized instruction: #{@instruction}"
      end
    end
  end
end
