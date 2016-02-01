require 'date'
require 'json'

module RecordParser
  class Record
    def initialize(string)
      @fields = string.delete(',|').split(' ')
    end

    def ==(anOther)
      fields == anOther.fields
    end

    def birth_date
      Date.strptime(fields.last, '%m/%d/%Y')
    end

    def gender
      @fields[2]
    end

    def last_name
      fields.first
    end

    def to_json(*a)
      Hash[*labels.zip(fields).flatten].to_json(*a)
    end

    def to_s
      fields.join(' ')
    end

  protected

    def fields
      @fields
    end

  private

    def labels
      %i(last_name first_name gender favorite_color birth_date)
    end
  end
end
