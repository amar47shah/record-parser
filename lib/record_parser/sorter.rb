module RecordParser
  class Sorter
    def initialize indexes
      @indexes = indexes
    end

    def sort records
      records.sort { |a, b| left_side(a, b) <=> right_side(a, b) }
    end

  private

    def left_side first, second
      @indexes.map do |attribute, order|
        record = order == :desc ? second : first
        record.send attribute
      end
    end

    def right_side first, second
      @indexes.map do |attribute, order|
        record = order == :desc ? first : second
        record.send attribute
      end
    end
  end
end
