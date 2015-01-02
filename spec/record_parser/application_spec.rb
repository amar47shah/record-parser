require 'spec_helper'

module RecordParser
  describe Application do
    let(:application) { Application.new(out) }
    let(:out) { double('Out') }
    before { allow(out).to receive(:puts) }
    describe '#run' do
      context 'with recognized sorting instruction' do
        shared_examples 'executes sorting' do |sorting_class, instruction|
          context "with instruction: #{instruction}" do
            let(:file) { double('File') }
            let(:sorting) { double('Sorting') }
            let(:record_one) { double('RecordOne') }
            let(:record_two) { double('RecordTwo') }
            let(:unsorted) { [record_one, record_two] }
            let(:sorted) { unsorted.reverse }
            let(:run_application) { application.run(instruction, file) }
            before do
              allow(file).to receive(:read).and_return("RecordOne\nRecordTwo\n")
              allow(RecordParser::Record).to receive(:new).
                                             with('RecordOne').
                                             and_return(record_one)
              allow(RecordParser::Record).to receive(:new).
                                             with('RecordTwo').
                                             and_return(record_two)
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
        let(:file) { double('File') }
        before { allow(file).to receive(:read) }
        shared_examples 'does not raise an error' do
          subject { -> { run_application } }
          it { is_expected.not_to raise_error }
        end
        context 'with unrecognized sorting instruction' do
          shared_examples 'handles unrecognized instruction' do |bad_instruction|
            let(:run_application) { application.run(bad_instruction, file) }
            before { allow(file).to receive(:read).and_return('') }
            context "when '#{bad_instruction}'" do
              it_has_behavior 'does not raise an error'
              it 'notifies the user' do
                expect(out).to receive(:puts).with(
                  "Unrecognized instruction: #{bad_instruction}"
                )
                run_application
              end
            end
          end
          it_has_behavior 'handles unrecognized instruction', 'middle-name'
          it_has_behavior 'handles unrecognized instruction', 'moms-maiden-name'
        end
        context 'with unreadable file' do
          shared_examples 'handles unreadable file' do |bad_filename|
            let(:run_application) { application.run('birth-date', file) }
            before do
              allow(file).to receive(:read).and_raise(Errno::ENOENT)
              allow(file).to receive(:filename).and_return(bad_filename)
            end
            context "when '#{bad_filename}" do
              it_has_behavior 'does not raise an error'
              it 'notifies the user' do
                expect(out).to receive(:puts).with(
                  "Could not read file: #{bad_filename}"
                )
                run_application
              end
            end
          end
          it_has_behavior 'handles unreadable file', 'my_fiels.txt'
          it_has_behavior 'handles unreadable file', 'My_fiwl.txt'
        end
      end
    end
  end
end
