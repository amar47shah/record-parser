require 'spec_helper'

module RecordParser
  describe Session do
    def expect_ordered_output(first, last)
      expect(out).to receive(:puts).with(first).ordered
      expect(out).to receive(:puts).with(last).ordered
    end

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
      shared_examples 'displays heading' do |show_method, heading|
        let(:contents) { "Record\n" }
        it "displays '#{heading}'" do
          expect_ordered_output(heading, 'Record')
          session.send(show_method)
        end
      end

      describe '#show_by_last_name_descending' do
        include_context 'file input'
        it_has_behavior 'displays heading',
                        :show_by_last_name_descending,
                        'Sorted by last name descending:'
        context 'with only one record' do
          it_has_behavior 'shows the single record',
                          :show_by_last_name_descending
        end
        context 'with two records' do
          shared_examples 'displays records in last name descending order' do
            it 'displays "Rue..." before "Chandra..."' do
              expect_ordered_output('Rue', 'Chandra')
              session.show_by_last_name_descending
            end
          end
          context 'with contents "Rue\nChandra\n"' do
            let(:contents) { "Rue\nChandra\n" }
            it_has_behavior 'displays records in last name descending order'
          end
          context 'with contents "Chandra\nRue\n"' do
            let(:contents) { "Chandra\nRue\n" }
            it_has_behavior 'displays records in last name descending order'
          end
        end
      end

      describe '#show_by_gender_and_last_name' do
        include_context 'file input'
        it_has_behavior 'displays heading',
                        :show_by_gender_and_last_name,
                        'Sorted by gender and last name:'
        context 'with only one record' do
          it_has_behavior 'shows the single record',
                          :show_by_gender_and_last_name
        end
        context 'with two records, both masculine' do
          shared_examples 'displays records in last name ascending order' do
            it 'displays "Chandra..." before "Robson..."' do
              expect_ordered_output('Chandra Mick M', 'Robson Marcus M')
              session.show_by_gender_and_last_name
            end
          end
          context 'out of order by last name ascending' do
            let(:contents) { "Robson Marcus M\nChandra Mick M\n" }
            it_has_behavior 'displays records in last name ascending order'
          end
          context 'already in order by last name ascending' do
            let(:contents) { "Chandra Mick M\nRobson Marcus M\n" }
            it_has_behavior 'displays records in last name ascending order'
          end
        end
        context 'with two records, both feminine' do
          context 'out of order by last name ascending' do
            let(:contents) { "Rue Sandra F\nHart Gershwin F\n" }
            it 'displays "Hart..." before "Rue..."' do
              expect_ordered_output('Hart Gershwin F', 'Rue Sandra F')
              session.show_by_gender_and_last_name
            end
          end
        end
        context 'with two records of different gender' do
          context 'with masculine first' do
            let(:contents) { "Chandra Mick M\nRue Sandra F\n" }
            it 'displays feminine before masculine' do
              expect_ordered_output('Rue Sandra F', 'Chandra Mick M')
              session.show_by_gender_and_last_name
            end
          end
        end
      end
    end
  end
end
