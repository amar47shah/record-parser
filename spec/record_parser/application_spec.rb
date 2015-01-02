require 'spec_helper'

module RecordParser
  describe Application do
    describe '::new' do
      subject { -> { Application.new } }
      it { is_expected.to raise_error(NoMethodError) }
    end

    describe '::run' do
      let(:out) { double('Out') }
      context 'with recognized sorting instruction' do
        shared_examples 'executes sorting' do |sorting_class, instruction|
          context "with instruction: #{instruction}" do
            let(:file) { double('File') }
            let(:sorting) { double('Sorting') }
            let(:record_one) { double('RecordOne') }
            let(:record_two) { double('RecordTwo') }
            let(:unsorted) { [record_one, record_two] }
            let(:sorted) { unsorted.reverse }
            let(:run_application) { Application.run(instruction, file, out) }
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
              sorted.each { |r| allow(out).to receive(:puts).with(r) }
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
      context 'with unrecognized sorting instruction' do
        shared_examples 'handles unrecognized instruction' do |bad_instruction|
          let(:run_application) { Application.run(bad_instruction, nil, out) }
          before { allow(out).to receive(:puts) }
          context "when '#{bad_instruction}'" do
            it 'does not raise error' do
              expect { run_application }.not_to raise_error
            end
            it 'notifies the user' do
              expect(out).to receive(:puts).
                             with("Unrecognized instruction: #{bad_instruction}")
              run_application
            end
          end
        end
        it_has_behavior 'handles unrecognized instruction', 'middle-name'
        it_has_behavior 'handles unrecognized instruction', 'moms-maiden-name'
      end
    end
  end
end
