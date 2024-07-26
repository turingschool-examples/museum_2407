require './lib/exhibit'
require './lib/patron'

RSpec.configure do |config| 
 config.formatter = :documentation 
 end

RSpec.describe Patron do 
  before(:each) do 
    @patron_1 = Patron.new("Bob", 20)
  end

  it 'exists and has attributes' do
    expect(@patron_1.name).to eq("Bob")
    expect(@patron_1.spending_money).to eq(20)
  end

  it 'has interests' do
    expect(@patron_1.interests).to eq([])
  end

  it 'can add to interests' do
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end
end