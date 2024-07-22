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
end