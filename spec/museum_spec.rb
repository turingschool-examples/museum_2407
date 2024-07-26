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
            expect(@dmns.recommend_exhibits(patron_1)).to eq ([])

            patron_1.add_interest("Gems and Minerals")
            patron_2.add_interest("Dead Sea Scrolls")
            patron_2.add_interest("IMAX")

            expect(@dmns.recommend_exhibits(patron_1).length).to eq (1)
            expect(@dmns.recommend_exhibits(patron_2).length).to eq (2)
            expect(@dmns.recommend_exhibits(patron_2).length).to eq (2)



        end

        xit 'should not add arguments if they are not Patron objects' do
            @dmns.add_exhibit("Gems and Minerals")
            incorrect_input = ""
            expect(@dmns.recommend_exhibits(patron_1).length).to eq (nil)
        end

    end
end