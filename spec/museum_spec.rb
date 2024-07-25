require './lib/museum'
require './lib/exhibit'
require './lib/patron'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Museum do
    before(:each) do
        @dmns = Museum.new("Denver Museum of Nature and Science")
        @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
        @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
        @imax = Exhibit.new({name: "IMAX",cost: 15})
    end

    describe 'instantiate' do
        it 'exists' do
            expect(@dmns).to be_an_instance_of Museum
        end

        it 'has a name' do
            expect(@dmns.name).to eq "Denver Museum of Nature and Science"
        end

        it 'has exhibits as an empty array' do
            expect(@dmns.exhibits).to eq []
        end
    end

    it 'can add exhibits' do
        @dmns.add_exhibit(@gems_and_minerals)
        @dmns.add_exhibit(@dead_sea_scrolls)
        @dmns.add_exhibit(@imax)

        expect(@dmns.exhibits).to eq [@gems_and_minerals, @dead_sea_scrolls, @imax]
    end

end