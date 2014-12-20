require 'spec_helper'

module RecordParser
  describe Session do
    def expect_output(message)
      expect(out).to receive(:puts).with(message)
    end

    let(:out) { double('Out') }
    let(:session) { Session.new(out) }
    let(:file) { double('File') }

    before do
      allow(out).to receive(:puts)
      allow(file).to receive(:read)
      allow(file).to receive(:filename)
    end

    describe '#initialize' do
      it 'welcomes' do
        expect_output('Welcome to the Record Parser')
        session
      end
    end

    describe '#input' do
      let(:filename) { 'data/records.txt' }
      before { allow(file).to receive(:filename).and_return(filename) }
      it 'announces the file being parsed' do
        expect_output("Parsing #{filename}")
        session.input(file)
      end
    end

    describe 'showing records' do
      shared_context 'file input' do
        before do
          allow(file).to receive(:read).and_return(contents)
          session.input(file)
        end
      end
      shared_examples 'shows the single record' do |show_method|
        let(:contents) { record }
        shared_examples 'displays the record' do
          it 'displays the record' do
            expect_output(record.chomp)
            session.send(show_method)
          end
        end
        context 'with record "Chandra\n"' do
          let(:record) { "Chandra\n" }
          it_has_behavior 'displays the record'
        end
        context 'with record "Rue\n"' do
          let(:record) { "Rue\n" }
          it_has_behavior 'displays the record'
        end
      end

      describe '#show_by_last_name_descending' do
        include_context 'file input'
        context 'when file has only one record' do
          it_has_behavior 'shows the single record',
                          :show_by_last_name_descending
        end
        context 'when file has two records' do
          shared_examples 'displays records in descending order' do
            it 'displays "Rue" and then "Chandra"' do
              expect(out).to receive(:puts).with('Rue').ordered
              expect(out).to receive(:puts).with('Chandra').ordered
              session.show_by_last_name_descending
            end
          end
          context 'with contents "Rue\nChandra\n"' do
            let(:contents) { "Rue\nChandra\n" }
            it_has_behavior 'displays records in descending order'
          end
          context 'with contents "Chandra\nRue\n"' do
            let(:contents) { "Chandra\nRue\n" }
            it_has_behavior 'displays records in descending order'
          end
        end
      end

      describe '#show_by_gender_and_last_name' do
        include_context 'file input'
        context 'when file has only one record' do
          it_has_behavior 'shows the single record',
                          :show_by_gender_and_last_name
        end
      end
    end
  end
end
