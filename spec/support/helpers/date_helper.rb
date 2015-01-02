require 'date'

module DateHelper
  def date_from(string)
    Date.strptime(string, '%m/%d/%Y')
  end
end

RSpec.configure do |config|
  config.include DateHelper
end
