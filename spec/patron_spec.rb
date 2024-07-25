require 'spec_helper'

RSpec.configure do |config| 
 config.formatter = :documentation 
end

RSpec.describe Exhibit do 
    before(:each) do
        @patron_1 = Patron.new("Bob", 20)
    end
    describe '#initialize()' do
        it 'creates an instance of an Patron object' do 
            expect(@exhibit).to be_a Patron
        end

        it 'holds a name attribute' do
            expect(@patron.name).to eq ("Bob")
        end
        
        it 'holds a money_spent attribute' do
            expect(@patron.money_spent).to eq (20)
        end
    end
end