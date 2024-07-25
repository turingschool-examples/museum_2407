require 'spec_helper'

RSpec.configure do |config| 
 config.formatter = :documentation 
end

RSpec.describe Exhibit do 
    before(:each) do
       @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    end
    describe '#initialize()' do
        it 'creates an instance of an Exhibit object' do 
            expect(@exhibit).to be_a Exhibit
        end

        it 'holds a hash containing a name KVP' do
            expect(@exhibit.name).to eq ("Gems and Minerals")
        end
        
        it 'holds a hash containing a cost KVP' do
            expect(@exhibit.cost).to eq (0)
        end
    end
end