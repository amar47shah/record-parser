require 'record_parser/reader'
require 'record_parser/record'

module API
  class Store
    class << self
      attr_writer :records
      undef_method :new

      def add(line)
        records << record_from(line)
      end

      def file=(file)
        @file = file
        @records = nil
      end

      def has_line?(line)
        records.include?(record_from(line))
      end

      def records
        @records ||= RecordParser::Reader.new(@file).records
      end

    private

      def record_from(line)
        RecordParser::Record.new(line)
      end
    end
  end
end
