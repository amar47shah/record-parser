module API
  class Store
    class << self
      attr_writer :file, :records
      undef_method :new

      def records
        @records ||= RecordParser::Reader.new(@file).records
      end
    end
  end
end
