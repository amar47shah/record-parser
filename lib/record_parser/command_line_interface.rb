require 'record_parser/reader'
require 'record_parser/sorter'

module RecordParser
  class CommandLineInterface
    def initialize(out)
      @out = out
    end

    def run(instruction, file)
      @instruction = instruction
      @file = file
      return unless indexes && unsorted_records
      display(sorted_records)
    end

  private

    def display(records)
      records.each { |record| @out.puts record }
    end

    def indexes
      case @instruction
      when 'birth-date'           then { birth_date: :asc }
      when 'gender-and-last-name' then { gender: :asc, last_name: :asc }
      when 'last-name-descending' then { last_name: :desc }
      else @out.puts "Unrecognized instruction: #{@instruction}"
      end
    end

    def sorted_records
      sorter.sort unsorted_records
    end

    def sorter
      @sorter ||= Sorter.new indexes
    end

    def unsorted_records
      @unsorted_records ||= Reader.new(@file).records
    rescue Errno::ENOENT => error
      filename = error.message.partition('@ rb_sysopen - ').last
      @out.puts "Could not read file: #{filename}"
    end
  end
end
