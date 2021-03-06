require 'spec_helper'

module RecordParser
  describe CommandLineInterface do
    describe '#run' do
      let(:run_application) { application.run(instruction, file) }
      let(:application) { CommandLineInterface.new(out) }
      let(:out) { double('Out') }
      let(:file) { double('File') }
      let(:reader) { double('Reader') }
      before do
        allow(out).to receive(:puts)
        allow(Reader).to receive(:new).with(file).and_return(reader)
      end

      context 'with good input' do
        shared_examples 'executes sorting' do |good_instruction, indexes|
          context "with instruction: #{good_instruction}" do
            let(:instruction) { good_instruction }
            let(:sorter) { double('Sorter') }
            let(:unsorted) { [double('RecordTwo'), double('RecordOne')] }
            let(:sorted) { unsorted.reverse }
            before do
              allow(reader).to receive(:records).and_return(unsorted)
              allow(Sorter).to receive(:new).with(indexes).and_return(sorter)
              allow(sorter).to receive(:sort).and_return(sorted)
            end
            it 'sorts' do
              expect(sorter).to receive(:sort).with(unsorted)
              run_application
            end
            it 'outputs the sorted records' do
              sorted.each { |r| expect(out).to receive(:puts).with(r).ordered }
              run_application
            end
          end
        end
        it_has_behavior 'executes sorting',
                        'birth-date',
                        birth_date: :asc
        it_has_behavior 'executes sorting',
                        'gender-and-last-name',
                        gender: :asc, last_name: :asc
        it_has_behavior 'executes sorting',
                        'last-name-descending',
                        last_name: :desc
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
              expect(Reader).not_to receive(:new)
              run_application
            end
          end
        end
        shared_examples 'handles unreadable file' do |bad_filename|
          let(:instruction) { 'birth-date' }
          before do
            allow(reader).to receive(:records).and_raise(
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
