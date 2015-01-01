require 'spec_helper'

module RecordParser
  describe Application do
    describe '::run' do
      let(:out) { double('Out') }

      shared_examples 'executes sorting' do |sorting_class, instruction|
        context "with instruction: #{instruction}" do
          let(:file) { double('File') }
          let(:sorting) { double('Sorting') }
          let(:run_application) { Application.run(instruction, file, out) }
          before do
            allow(sorting_class).to receive(:new).and_return(sorting)
            allow(sorting).to receive(:show)
          end
          it "instantiates a #{sorting_class}" do
            expect(sorting_class).to receive(:new).with(file, out)
            run_application
          end
          it 'shows sorting' do
            expect(sorting).to receive(:show)
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
