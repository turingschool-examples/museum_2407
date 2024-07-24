require './lib/patron'

RSpec.describe Patron do
    before(:each) do
        @patron_1 = Patron.new("Bob, 20")

    end

    describe '#initalize' do
        it "exists" do
            expect(patron_1).to be_an_instance_of Patron
        end

        it 'has a name' do

        end

        it 'has spending money' do

        end


    end





end