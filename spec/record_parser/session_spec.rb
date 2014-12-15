require 'spec_helper'

module RecordParser
  describe Session do
    def expect_output(message)
      expect(out).to receive(:puts).with(message)
    end

    let(:out) { double('Out') }
    let(:session) { Session.new(out) }

    before { allow(out).to receive(:puts) }

    describe '#initialize' do
      it 'welcomes' do
        expect_output('Welcome to the Record Parser')
        session
      end
    end

    describe '#input' do
      let(:file) { double('File') }
      it 'notes the file being parsed' do
        expect_output("Parsing #{file}")
        session.input(file)
      end
    end
  end
end
