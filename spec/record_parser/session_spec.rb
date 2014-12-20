require 'spec_helper'

module RecordParser
  shared_examples 'displays the record' do
    it 'displays the record' do
      expect_output(contents.chomp)
      session.show_by_last_name_descending
    end
  end

  shared_examples 'displays records in descending order' do
    it 'displays "Rue" and then "Chandra"' do
      expect(out).to receive(:puts).with('Rue').ordered
      expect(out).to receive(:puts).with('Chandra').ordered
      session.show_by_last_name_descending
    end
  end

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

    describe '#show_by_last_name_descending' do
      before do
        allow(file).to receive(:read).and_return(contents)
        session.input(file)
      end
      context 'when file has one record' do
        context 'with contents "Chandra\n"' do
          let(:contents) { "Chandra\n" }
          it_has_behavior 'displays the record'
        end
        context 'with contents "Rue\n"' do
          let(:contents) { "Rue\n" }
          it_has_behavior 'displays the record'
        end
      end
      context 'when file has two records' do
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
  end
end
