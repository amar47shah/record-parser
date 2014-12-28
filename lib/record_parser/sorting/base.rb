module RecordParser
  module Sorting
    class Base
      def initialize(file, out)
        @contents = file.read
        @out = out
      end

    private

      def display(records)
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
end
