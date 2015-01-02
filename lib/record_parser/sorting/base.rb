module RecordParser
  module Sorting
    class Base
      def initialize(file)
        @contents = file.read
      end

    private

      def records
        @contents.lines.map { |line| Record.new(line.chomp) }
      end
    end
  end
end
