require 'spec_helper'

RSpec.configure do |config| 
 config.formatter = :documentation 
end

RSpec.describe Patron do 
    before(:each) do
        @patron = Patron.new("Bob", 20)
    end
    describe '#initialize()' do
        it 'creates an instance of an Patron object' do 
            expect(@patron).to be_a Patron
        end

        it 'holds a name attribute' do
            expect(@patron.name).to eq ("Bob")
        end
        
        it 'holds a money_spent attribute' do
            expect(@patron.money_spent).to eq (20)
        end

        it 'should hold an interst array, initilized to be empty' do
            expect(@patron.interests.empty?).to eq (true)
        end
    end

    describe '#add_interst()' do
        it 'should add argument to intersts array' do
            @patron.add_interest("Dead Sea Scrolls")
            expect(@patron.intersts[0]).to eq ("Dead Sea Scrolls")
            
            @patron.add_interest("Gems and Minerals")
            expect(@patron.intersts[1]).to eq ("Dead Sea Scrolls")
            expect(@patron.intersts[2]).to eq (nil)

            expect(@patron.intersts).to eq (["Dead Sea Scrolls", "Gems and Minerals"])
        end
    end
end