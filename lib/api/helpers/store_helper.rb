require 'api/store'

module API
  module Helpers
    module StoreHelper
      def records
        API::Store.records
      end
    end
  end
end
