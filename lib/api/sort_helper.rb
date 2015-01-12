module API
  module SortHelper
    def sort(records, view)
      RecordParser::Sorting.const_get(view).new(records).sort
    end
  end
end
