require 'spec_helper'

module RecordParser
  describe Session do
    let(:out) { double('Out') }
    let(:session) { Session.new(out) }

    before { allow(out).to receive(:puts) }

    describe '#initialize' do
      it 'welcomes' do
        expect(out).to receive(:puts).with('Welcome to the Record Parser')
        session
      end
    end

    describe '#input' do
      let(:file) { double('File') }
      it 'notes the file being parsed' do
        expect(out).to receive(:puts).with("Parsing #{file}")
        session.input(file)
      end
    end
  end
end
