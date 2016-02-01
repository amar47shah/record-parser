module RecordParser
  class Sorter
    def initialize indexes
      @indexes = indexes
    end

    def sort records
      records.sort do |first, second|
        @indexes.map do |attribute, order|
          left = order == :desc ? second : first
          left.send attribute
        end <=>
        @indexes.map do |attribute, order|
          right = order == :desc ? first : second
          right.send attribute
        end
      end
    end
  end
end
