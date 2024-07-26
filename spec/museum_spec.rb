require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.configure do |config| 
 config.formatter = :documentation 
 end

RSpec.describe Museum do 
  before(:each) do 
   @dmns = Museum.new("Denver Museum of Nature and Science")
   @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
   @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
   @imax = Exhibit.new({name: "IMAX",cost: 15})
   @patron_1 = Patron.new("Bob", 0)
   @patron_2 = Patron.new("Sally", 20)
   @patron_3 = Patron.new("Johnny", 5)
  end

  it 'exists and has atrributes' do
    expect(@dmns.name).to eq("Denver Museum of Nature and Science")
    expect(@dmns.exhibits).to eq([])
  end

  it 'can add stuff to exhibits' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
  end

  it 'can add patrons and their interests' do
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@imax)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("IMAX")

    expect(@dmns.recommend_exhibits(@patron_1)).to eq([@dead_sea_scrolls, @gems_and_minerals])
    expect(@dmns.recommend_exhibits(@patron_2)).to eq([@imax])
  end

  it 'has an empty array for patrons by default' do
    expect(@dmns.patrons).to eq([])
  end

  it 'can add patrons to the array' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
       
    @patron_1.add_interest("Gems and Minerals")
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_2.add_interest("Dead Sea Scrolls")
    @patron_3.add_interest("Dead Sea Scrolls")
    
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)
    
    expect(@dmns.patrons).to eq([@patron_1, @patron_2, @patron_3])
  end

  it 'can lists patrons_by_exhibit_interest' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
       
    @patron_1.add_interest("Gems and Minerals")
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_2.add_interest("Dead Sea Scrolls")
    @patron_3.add_interest("Dead Sea Scrolls")
    
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)
    expected = {
      @gems_and_minerals => [@patron_1],
      @dead_sea_scrolls => [@patron_1, @patron_2, @patron_3],
      @imax => []
    }
    expect(@dmns.patrons_by_exhibit_interest).to eq(expected)
   end

   it 'can have ticket_lottery_contestants array of patrons' do
    @dmns.add_exhibit(@dead_sea_scrolls)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_2.add_interest("Dead Sea Scrolls")
    @patron_3.add_interest("Dead Sea Scrolls")
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_3)
    expect(@dmns.ticket_lottery_contestants(@dead_sea_scrolls)).to eq([@patron_1, @patron_3])

    # @dmns.add_exhibit(@gems_and_minerals)
    # expect(@dms.ticket_lottery_contestants(@gems_and_minerals)).to eq(nil)
  
   end

   it 'can call a lottery winner' do
    @dmns.add_exhibit(@dead_sea_scrolls)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_2.add_interest("Dead Sea Scrolls")
    @patron_3.add_interest("Dead Sea Scrolls")
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_3)
    expect(@dmns.ticket_lottery_contestants(@dead_sea_scrolls)).to eq([@patron_1, @patron_3])

    expect(@dmns.draw_lottery_winner(@dead_sea_scrolls)).to eq(@patron_1).or eq(@patron_3)
    # @dmns.add_exhibit(@gems_and_minerals)
    # expect(@dms.ticket_lottery_contestants(@gems_and_minerals)).to eq(nil)
    # expect(@dmns.draw_lottery_winner(@gems_and_minerals)).to eq(nil)
   end

   it 'annnounces lottery winner' do
    @dmns.add_exhibit(@imax)
    @patron_1.add_interest("IMAX")
   
    @patron_3.add_interest("IMAX")
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_3)
    expect(@dmns.ticket_lottery_contestants(@imax)).to eq([@patron_1, @patron_3])

    expect(@dmns.draw_lottery_winner(@imax)).to eq(@patron_1).or eq(@patron_3)
    expect(@dmns.announce_lottery_winner(@imax)).to eq("Johnny has won the IMAX exhibit lottery").or eq("Bob has won the IMAX exhibit lottery")
   end
end

