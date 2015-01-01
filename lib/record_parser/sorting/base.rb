module RecordParser
  module Sorting
    class Base
      def initialize(file, out)
        @contents = file.read
        @out = out
      end

    private

      def display(records)
        records.each { |record| @out.puts record }
      end

      def records
        @contents.lines.map { |line| Record.new(line.chomp) }
      end
    end
  end
end
