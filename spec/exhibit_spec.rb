require './lib/exhibit'
require './lib/patron'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Exhibit do
    before(:each) do
        @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    end
    
    describe 'instantiate' do
        it 'exists' do
            expect(@exhibit).to be_an_instance_of Exhibit
        end

        it 'has a name' do
            expect(@exhibit.name).to eq "Gems and Minerals"
        end

        it 'has a cost' do
            expect(@exhibit.cost).to eq 0
        end
    end
end