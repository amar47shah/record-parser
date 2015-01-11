require 'spec_helper'

module RecordParser
  describe CommandLineInterface do
    describe '#run' do
      let(:run_application) { application.run(instruction, file) }
      let(:application) { CommandLineInterface.new(out) }
      let(:out) { double('Out') }
      let(:file) { double('File') }
      before do
        allow(out).to receive(:puts)
        allow(file).to receive(:readlines).and_return([])
      end

      context 'with good input' do
        shared_examples 'executes sorting' do |sorting_class, good_instruction|
          context "with instruction: #{good_instruction}" do
            let(:instruction) { good_instruction }
            let(:sorting) { double('Sorting') }
            let(:lines_records) do
              { line_one => record_one, line_two => record_two }
            end
            let(:line_one) { "RecordOne\n" }
            let(:line_two) { "RecordTwo\n" }
            let(:record_one) { double(line_one.chomp) }
            let(:record_two) { double(line_two.chomp) }
            let(:unsorted) { lines_records.values }
            let(:sorted) { unsorted.reverse }
            before do
              allow(file).to receive(:readlines).and_return(lines_records.keys)
              lines_records.each do |line, record|
                allow(
                  RecordParser::Record
                ).to receive(:new).with(line.chomp).and_return(record)
              end
              allow(sorting_class).to receive(:new).and_return(sorting)
              allow(sorting).to receive(:sort).and_return(sorted)
            end
            it "instantiates a #{sorting_class}" do
              expect(sorting_class).to receive(:new).with(unsorted)
              run_application
            end
            it 'sorts' do
              expect(sorting).to receive(:sort)
              run_application
            end
            it 'outputs the sorted records' do
              sorted.each { |r| expect(out).to receive(:puts).with(r).ordered }
              run_application
            end
          end
        end
        it_has_behavior 'executes sorting',
                        Sorting::ByBirthDate,
                        'birth-date'
        it_has_behavior 'executes sorting',
                        Sorting::ByGenderAndLastName,
                        'gender-and-last-name'
        it_has_behavior 'executes sorting',
                        Sorting::ByLastNameDescending,
                        'last-name-descending'
      end

      context 'with bad input' do
        shared_examples 'does not raise an error' do
          subject { -> { run_application } }
          it { is_expected.not_to raise_error }
        end
        shared_examples 'notifies the user' do |message|
          it "displays '#{message}'" do
            expect(out).to receive(:puts).with(message)
            run_application
          end
        end
        shared_examples 'handles unrecognized instruction' do |bad_instruction|
          let(:instruction) { bad_instruction }
          context "when '#{bad_instruction}'" do
            it_has_behavior 'does not raise an error'
            it_has_behavior 'notifies the user',
                            "Unrecognized instruction: #{bad_instruction}"
            it 'does not read the file' do
              expect(file).not_to receive(:readlines)
              run_application
            end
          end
        end
        shared_examples 'handles unreadable file' do |bad_filename|
          let(:instruction) { 'birth-date' }
          before do
            allow(file).to receive(:readlines).and_raise(
              Errno::ENOENT,
              "No such file or directory @ rb_sysopen - #{bad_filename}"
            )
          end
          context "when '#{bad_filename}" do
            it_has_behavior 'does not raise an error'
            it_has_behavior 'notifies the user',
                            "Could not read file: #{bad_filename}"
          end
        end
        it_has_behavior 'handles unrecognized instruction', 'middle-name'
        it_has_behavior 'handles unrecognized instruction', 'moms-maiden-name'
        it_has_behavior 'handles unreadable file', 'my_fiels.txt'
        it_has_behavior 'handles unreadable file', 'My_fiwl.txt'
      end
    end
  end
end
