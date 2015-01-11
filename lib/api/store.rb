module API
  class Store
    class << self
      attr_writer :records
      undef_method :new

      def file=(file)
        @file = file
        @records = nil
      end

      def records
        @records ||= RecordParser::Reader.new(@file).records
      end
    end
  end
end
