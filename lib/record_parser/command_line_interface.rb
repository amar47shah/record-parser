require 'record_parser/reader'
require 'record_parser/sorting'

module RecordParser
  class CommandLineInterface
    def initialize(out)
      @out = out
    end

    def run(instruction, file)
      @instruction = instruction
      @file = file
      return unless sorting_class && unsorted_records
      display(sorted_records)
    end

  private

    def camelcase_instruction
      @instruction.split('-').map(&:capitalize).join
    end

    def display(records)
      records.each { |record| @out.puts record }
    end

    def sorted_records
      sorting_class.new(unsorted_records).sort
    end

    def sorting_class
      Sorting.const_get(:"By#{camelcase_instruction}")
    rescue NameError
      @out.puts "Unrecognized instruction: #{@instruction}"
    end

    def unsorted_records
      @unsorted_records ||= Reader.new(@file).records
    rescue Errno::ENOENT => error
      filename = error.message.partition('@ rb_sysopen - ').last
      @out.puts "Could not read file: #{filename}"
    end
  end
end
