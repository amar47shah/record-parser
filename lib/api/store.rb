module API
  class Store
    class << self
      attr_writer :file
      undef_method :new

      def records
        RecordParser::Reader.new(@file).records
      end
    end
  end
end
