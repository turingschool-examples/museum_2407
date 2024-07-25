require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do
    before(:each) do
        @dmns = Museum.new("Denver Museum of Nature and Science")

        @gems = Exhibit.new({name: "Gems and Minerals", cost: 0})
        @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
        @imax = Exhibit.new({name: "IMAX",cost: 15})

        @patron_1 = Patron.new("Bob", 0)
        @patron_2 = Patron.new("Sally", 20)
        @patron_3 = Patron.new("Johnny", 5)
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
            @dmns.add_exhibit(@gems)
            @dmns.add_exhibit(@dead_sea_scrolls)
            @dmns.add_exhibit(@imax)


            @patron_1.add_interest("Dead Sea Scrolls")
            @patron_1.add_interest("Gems and Minerals")
            @patron_2.add_interest("IMAX")

            bob_list = [@gems, @dead_sea_scrolls]
            sally_list = [@imax]

            expect(@dmns.recommend_exhibits(@patron_1)).to eq bob_list
            expect(@dmns.recommend_exhibits(@patron_2)).to eq sally_list
        end
    end

    describe 'patrons' do
        it 'has patrons' do
            expect(@dmns.patrons).to eq []
        end

        it 'can add patrons' do
            @dmns.admit(@patron_1)
            @dmns.admit(@patron_2)
            @dmns.admit(@patron_3)

            expect(@dmns.patrons).to eq [@patron_1, @patron_2, @patron_3]
        end

        it 'produces hash of exhibits and interested patrons' do
            @dmns.add_exhibit(@gems)
            @dmns.add_exhibit(@dead_sea_scrolls)
            @dmns.add_exhibit(@imax)

            @patron_1.add_interest("Gems and Minerals")
            @patron_1.add_interest("Dead Sea Scrolls")
            @patron_2.add_interest("Dead Sea Scrolls")
            @patron_3.add_interest("Dead Sea Scrolls")

            @dmns.admit(@patron_1)
            @dmns.admit(@patron_2)
            @dmns.admit(@patron_3)

            expect(@dmns.patrons_by_exhibit_interest).to be_an_instance_of Hash
        end
    end

    describe 'lottery' do
        before(:each) do
            @dmns.add_exhibit(@gems)
            @dmns.add_exhibit(@dead_sea_scrolls)
            @dmns.add_exhibit(@imax)

            @patron_1.add_interest("Gems and Minerals")
            @patron_1.add_interest("Dead Sea Scrolls")
            @patron_2.add_interest("Dead Sea Scrolls")
            @patron_3.add_interest("Dead Sea Scrolls")

            @dmns.admit(@patron_1)
            @dmns.admit(@patron_2)
            @dmns.admit(@patron_3)
        end

        it 'know patrons interested in exhibits but lack funds' do
            expect(@dmns.ticket_lottery_contestants(@dead_sea_scrolls)).to eq([@patron_1, @patron_3])
        end

        it 'draws lottery winner' do
            expect(@dmns.draw_lottery_winner(@dead_sea_scrolls)).to be_an_instance_of Patron
        end

        it 'does not draw winner if conditions are not met' do
            expect(@dmns.draw_lottery_winner(@gems)).to eq(nil)
        end

        it 'announces lottery winner' do
            @patron_1.add_interest("IMAX")

            stub_winner = "Bob has won the IMAX exhibit lottery"
            expect(@dmns.announce_lottery_winner(@imax)).to eq(stub_winner)
        end

        it 'announces no winners' do
            no_winner = "No winners for this lottery"
            expect(@dmns.announce_lottery_winner(@gems)).to eq(no_winner)
        end
    end



end