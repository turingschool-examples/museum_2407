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
            expect(@dmns.exhibits.empty?).to eq (true)
        end
    end

    describe '#add_exhibit()' do
        it 'should add the argument to the exhibits array' do
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            # dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            # imax = Exhibit.new({name: "IMAX",cost: 15})
            # @dmns.add_exhibit(gems_and_minerals)

            expect{@dmns.add_exhibit(gems_and_minerals)}.to change{@dmns.exhibits.empty?}.from(true).to(false)
            expect(@dmns.exhibits[0].name).to eq ("Gems and Minerals")
        end
        it 'should not add arguments if they are not Exhibit objects' do
            @dmns.add_exhibit("string")
            expect(@dmns.exhibits.empty?).to eq (true)
        end
    end
    
    describe '#recommend_exhibits()' do
        it 'will return an array of exhibits based on the argument/Patrons interests' do
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})
            patron_1 = Patron.new("Bob", 20)
            patron_2 = Patron.new("Julia", 400)
            @dmns.add_exhibit(gems_and_minerals)
            @dmns.add_exhibit(dead_sea_scrolls)
            @dmns.add_exhibit(imax)
            #require'pry';binding.pry
            expect(@dmns.recommend_exhibits(patron_1)).to eq ([])

            patron_1.add_interest("Gems and Minerals")
            patron_2.add_interest("Dead Sea Scrolls")
            patron_2.add_interest("IMAX")

            expect(@dmns.recommend_exhibits(patron_1).length).to eq (1)
            expect(@dmns.recommend_exhibits(patron_2).length).to eq (2)
        end

        it 'should not add arguments if they are not Patron objects' do
            @dmns.add_exhibit("Gems and Minerals")
            incorrect_input = true
            expect(@dmns.recommend_exhibits(incorrect_input)).to eq (nil)
        end
    end

    describe '#patrons_by_exhibit_interest' do
        it 'returns a Hash' do
            expect(@dmns.patrons_by_exhibit_interest).to be_a (Hash)
        end

        it 'shows each Exhibit as its own key' do
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})
            @dmns.add_exhibit(gems_and_minerals)
            @dmns.add_exhibit(dead_sea_scrolls)
            @dmns.add_exhibit(imax)

            expect(@dmns.patrons_by_exhibit_interest.keys.length).to eq (3)
            expect(@dmns.patrons_by_exhibit_interest.keys[0].name).to eq ("Gems and Minerals")
            expect(@dmns.patrons_by_exhibit_interest.keys[1].name).to eq ("Dead Sea Scrolls")
            expect(@dmns.patrons_by_exhibit_interest.keys[2].name).to eq ("IMAX")
            
        end
        it 'each value is an Array of Patron objects who are interested in the Exhibit key' do
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})
            @dmns.add_exhibit(gems_and_minerals)
            @dmns.add_exhibit(dead_sea_scrolls)
            @dmns.add_exhibit(imax)

            patron_1 = Patron.new("Bob", 20)
            patron_2 = Patron.new("Julia", 400)
            patron_3 = Patron.new("Chandler", 0)
            #require'pry';binding.pry

            patron_1.add_interest(gems_and_minerals)

            patron_2.add_interest(gems_and_minerals)
            patron_2.add_interest(dead_sea_scrolls)
            
            patron_3.add_interest(gems_and_minerals)
            patron_3.add_interest(dead_sea_scrolls)
            patron_3.add_interest(imax)

            expect(@dmns.patrons_by_exhibit_interest.values[0].length).to eq (3)
            expect(@dmns.patrons_by_exhibit_interest.values[1].length).to eq (2)
            expect(@dmns.patrons_by_exhibit_interest.values[2].length).to eq (1)
        end
    
    end

    describe '#ticket_lottery_contestants()' do 
        it 'generates an Array of patrons' do
            imax = Exhibit.new({name: "IMAX",cost: 15})
            @dmns.add_exhibit(imax)
            
            expect(@dmns.ticket_lottery_contestants(imax)).to be_a (Array)
        end
        it 'will contain a list of all patrons who are interested in an exhibit && do not hacve enough money to partake' do
            imax = Exhibit.new({name: "IMAX",cost: 15})
            @dmns.add_exhibit(imax)

            patron_1 = Patron.new("Bob", 20)
            patron_2 = Patron.new("Julia", 5)
            patron_3 = Patron.new("Chandler", 14)
            patron_4 = Patron.new("Gilfoyle", 15)

            patron_1.add_interest(imax)
            patron_2.add_interest(imax)
            patron_3.add_interest(imax)
            patron_4.add_interest(imax)


            expect(@dmns.ticket_lottery_contestants(imax).length).to eq (2)
            expect(@dmns.ticket_lottery_contestants(imax)[0].name).to eq ("Chandler")
            expect(@dmns.ticket_lottery_contestants(imax)[1].name).to eq ("Julia")
        end
    end
    
    describe '#draw_lottery_winner()' do
        it 'will return a contestant randomly drawn from the return of #ticket_lottery_contestants()' do
            imax = Exhibit.new({name: "IMAX",cost: 15})
            @dmns.add_exhibit(imax)

            patron_1 = Patron.new("Bob", 20)
            patron_2 = Patron.new("Julia", 5)
            patron_3 = Patron.new("Chandler", 14)
            patron_4 = Patron.new("Gilfoyle", 15)

            patron_1.add_interest(imax)
            patron_2.add_interest(imax)
            patron_3.add_interest(imax)
            patron_4.add_interest(imax)

            @dmns.ticket_lottery_contestants(imax)

            allow(@dmns).to receive(:draw_lottery_winner).with(imax).and_return(patron_2)
            winner = @dmns.draw_lottery_winner(imax)
            expect(@dmns.ticket_lottery_contestants(imax)).to include(winner)
        end

    end
    
    describe '#announce_lottery_winner' do
        it 'will return nil if no contestants are qualified for the lottery' do
            imax = Exhibit.new({name: "IMAX",cost: 15})
            @dmns.add_exhibit(imax)
        end
        
        it 'will return #{name} has won the #{exhibit} exhibit lottery when there is a pool of canidates' do

        end
        
        it 'will return No winners for this lottery if there are no contestants in the pool of canidates' do

        end
    end
end