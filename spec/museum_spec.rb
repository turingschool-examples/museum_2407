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
            @dmns.add_exhibit(gems_and_minerals)

            expect{@dmns.add_exhibit}.to_change{@dmns.exhibits.empty?}.from(true).to(false)
            expect(@dmns.exhibits[0][:name]).to eq ("Gems and Minerals")
        end
    end
    
    describe '#recommend_exhibits()' do

    end
end