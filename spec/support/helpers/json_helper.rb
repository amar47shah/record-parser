require 'json'

module JSONHelper
  def for_record_from(input)
    InputSerializer.hash_from(input).to_json
  end

  def for_records_from(inputs)
    inputs.map { |input| InputSerializer.hash_from(input) }.to_json
  end

  class InputSerializer
    class << self
      def hash_from(input)
        Hash[*labels.zip(fields_from(input)).flatten]
      end

    private

      def fields_from(input)
        input.split(' ')
      end

      def labels
        %i(last_name first_name gender favorite_color birth_date)
      end
    end
  end
end

RSpec.configure do |config|
  config.include JSONHelper
end
