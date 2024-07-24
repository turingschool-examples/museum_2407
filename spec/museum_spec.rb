require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do
    before(:each) do
        @dmns = Museum.new("Denver Museum of Nature and Science")
        @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
        @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
        @imax = Exhibit.new({name: "IMAX",cost: 15})
    end

    describe 'initalize' do
        it 'exists' do
            expect(@dmns).to be_an_instance_of Museum
        end

        it 'has a name' do
            expect(@dmns.name).to eq "Denver Museum of Nature and Science"
        end

        it 'has exhibits' do
            expect(@dmns.exhibits).to eq []
        end
    end

    describe '@add exhibits' do
        it 'can add exhibits' do

            @dmns.add_exhibit("Gems and Minerals")
            @dmns.add_exhibit("Dead Sea Scrolls")
            @dmns.add_exhibit("IMAX")
            new_exhibits = ["Gems and Minerals", "Dead Sea Scrolls", "IMAX"]

            expect(@dmns.exhibits).to eq new_exhibits
            
        end
    end




end