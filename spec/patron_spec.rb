require './lib/exhibit'
require './lib/patron'

RSpec.describe Patron do 
  before(:each) do 
    @patron_1 = Patron.new("Bob", 20)
  end

  describe '#initialize' do 
    it 'exists' do 
      expect(@patron_1.name).to eq("Bob")
      expect(@patron_1.spending_money).to eq(20)
    end
  end

  describe '#interests' do 
    it 'has no interests right now' do 
    expect(@patron_1.interests).to eq([])
    end
  end

  describe '#add_interests' do 
    it 'has interests now' do 
      @patron_1.add_interests("Dead Sea Scrolls")
      @patron_1.add_interests("Gems and Minerals")
      expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
    end
  end
end