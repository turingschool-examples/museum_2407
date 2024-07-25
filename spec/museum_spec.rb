require './lib/museum'
require './lib/exhibit'
require './lib/patron'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Museum do
    before(:each) do
        @dmns = Museum.new("Denver Museum of Nature and Science")
    end

    describe 'instantiate' do
        it 'exists' do
            expect(@dmns).to be_an_instance_of Museum
        end

        it 'has a name' do
            expect(@dmns.name).to eq "Denver Museum of Nature and Science"
        end
    end

end