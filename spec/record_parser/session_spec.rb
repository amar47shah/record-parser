require 'spec_helper'

module RecordParser
  shared_examples 'displays the contents' do
    it 'displays the contents' do
      expect_output(contents.chomp)
      session.show
    end
  end

  shared_examples 'displays lines in descending order' do
    it 'displays each line' do
      expect(out).to receive(:puts).with("Rue").ordered
      expect(out).to receive(:puts).with("Chandra").ordered
      session.show
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
    end

    describe '#initialize' do
      it 'welcomes' do
        expect_output('Welcome to the Record Parser')
        session
      end
    end

    describe '#input' do
      it 'notes the file being parsed' do
        expect_output("Parsing #{file}")
        session.input(file)
      end
    end

    describe '#show' do
      before do
        allow(file).to receive(:read).and_return(contents)
        session.input(file)
      end
      context 'when file has one record' do
        context 'with contents "Chandra\n"' do
          let(:contents) { "Chandra\n" }
          it_has_behavior 'displays the contents'
        end
        context 'with contents "Rue\n"' do
          let(:contents) { "Rue\n" }
          it_has_behavior 'displays the contents'
        end
      end
      context 'when file has two records' do
        context 'with contents "Rue\nChandra\n"' do
          let(:contents) { "Rue\nChandra\n" }
          it_has_behavior 'displays lines in descending order'
        end
        context 'with contents "Chandra\nRue\n"' do
          let(:contents) { "Chandra\nRue\n" }
          it_has_behavior 'displays lines in descending order'
        end
      end
    end
  end
end
