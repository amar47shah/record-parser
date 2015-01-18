require 'api/store'

module API
  module Helpers
    module CreateHelper
      def create_record_from(line)
        Store.add(line)
      end
    end
  end
end
