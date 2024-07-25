require './lib/exhibit'
require './lib/patron'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Patron do
    before(:each) do 
        @patron_1 = Patron.new("Bob", 20)
    end
    
    describe 'instantiate' do
        it 'exists' do
            expect(@patron_1).to be_an_instance_of Patron
        end
    end
    
end