require './lib/exhibit'
require './lib/patron'

RSpec.configure do |config| 
 config.formatter = :documentation 
 end

 RSpec.describe Exhibit do 
  before(:each) do 
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end
  
    it 'can exist and have attributes' do
      expect(@exhibit.name).to eq("Gems and Minerals")
      expect(@exhibit.cost).to eq(0)
    end
end