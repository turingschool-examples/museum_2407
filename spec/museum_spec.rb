require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do
    before(:each) do
        @dmns = Museum.new("Denver Museum of Nature and Science")

        @gems = Exhibit.new({name: "Gems and Minerals", cost: 0})
        @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
        @imax = Exhibit.new({name: "IMAX",cost: 15})

        @patron_1 = Patron.new("Bob", 20)
        @patron_2 = Patron.new("Sally", 20)
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

    describe '#add exhibits' do
        it 'can add exhibits' do

            @dmns.add_exhibit(@gems)
            @dmns.add_exhibit(@dead_sea_scrolls)
            @dmns.add_exhibit(@imax)
            new_exhibits = [@gems, @dead_sea_scrolls, @imax]

            expect(@dmns.exhibits).to eq new_exhibits
            
        end
    end

    describe '#recommend exhibits' do
        it 'can recommend exhibits by interest' do
            @dmns.add_exhibit("Gems and Minerals")
            @dmns.add_exhibit("Dead Sea Scrolls")
            @dmns.add_exhibit("IMAX")


            @patron_1.add_interest("Dead Sea Scrolls")
            @patron_1.add_interest("Gems and Minerals")
            @patron_2.add_interest("IMAX")

            bob_list = [@dead_sea_scrolls, @gems]
            sally_list = [@imax]

            expect(@dmns.recommend_exhibits(@patron_1)).to eq bob_list
            expect(@dmns.recommend_exhibits(@patron_2)).to eq sally_list

        end
    end



end