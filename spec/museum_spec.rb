require 'spec_helper'

RSpec.configure do |config| 
    config.formatter = :documentation 
end
   
RSpec.describe Museum do 
    before(:each) do
        @dmns = Museum.new("Denver Museum of Nature and Science")
    end

    describe '#initialize()' do
        it 'creates an instance of an Patron object' do 
            expect(@dmns).to be_a Museum
        end

        it 'has a name passed in as an argument' do
            expect(@dmns.name).to eq ("Denver Museum of Nature and Science")
        end

        it 'has an exhibits attribute set to hold an empty array' do
            expect(@dmns.exhibits).to be_a (Array)
            expect(@dmns.exhibits.empty?).to be_a (true)
        end
    end

    describe '#add_exhibit()' do
    
    end
    
    describe '#recommend_exhibits()' do

    end
end