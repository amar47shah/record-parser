require 'spec_helper'

module RecordParser
  describe Sorting do
    def expect_output(message)
      expect(out).to receive(:puts).with(message)
    end

    let(:out) { double('Out') }
    let(:file) { double('File') }
    let(:controller) { Sorting.new(out) }

    before do
      allow(out).to receive(:puts)
      allow(file).to receive(:read)
      allow(file).to receive(:filename)
    end

    describe '#initialize' do
      it 'welcomes' do
        expect_output('Welcome to the Record Parser')
        controller
      end
    end

    describe '#input' do
      let(:filename) { 'data/records.txt' }
      before { allow(file).to receive(:filename).and_return(filename) }
      it 'announces the file being parsed' do
        expect_output("Parsing #{filename}")
        controller.input(file)
      end
    end

    describe 'showing records' do
      def expect_ordered_output(first, last)
        expect(out).to receive(:puts).with(first).ordered
        expect(out).to receive(:puts).with(last).ordered
      end

      before do
        allow(file).to receive(:read).and_return(contents)
        controller.input(file)
      end

      shared_examples 'displays heading' do |show_method, heading|
        let(:contents) { "Record\n" }
        it "displays a blank line before '#{heading}'" do
          expect_ordered_output('', heading)
          controller.send(show_method)
        end
        it "displays '#{heading}' before the records" do
          expect_ordered_output(heading, 'Record')
          controller.send(show_method)
        end
      end
      shared_examples 'shows sorted records' do |show_method, sort_method|
        let(:contents) { "Record One\nRecord Two\n" }
        let(:sorted) { unsorted.reverse }
        let(:sorter) { double('Sorter') }
        let(:unsorted) { contents.lines.map(&:chomp) }
        before do
          allow(Sorter).to receive(:new).with(unsorted).and_return(sorter)
          allow(sorter).to receive(sort_method).and_return(sorted)
        end
        it 'displays the sorted records' do
          expect_ordered_output(*sorted)
          controller.send(show_method)
        end
      end
      shared_examples 'displays heading and sorted records' do |show_method, heading, sort_method|
        it_has_behavior 'displays heading', show_method, heading
        it_has_behavior 'shows sorted records', show_method, sort_method
      end

      describe '#show_by_last_name_descending' do
        it_has_behavior 'displays heading and sorted records',
                        :show_by_last_name_descending,
                        'Sorted by last name descending:',
                        :records_by_last_name_descending
      end

      describe '#show_by_gender_and_last_name' do
        it_has_behavior 'displays heading and sorted records',
                        :show_by_gender_and_last_name,
                        'Sorted by gender and last name:',
                        :records_by_gender_and_last_name
      end
    end
  end
end
