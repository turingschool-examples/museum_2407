require './lib/exhibit'
require './lib/patron'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSspec.describe Exhibit do
    describe 'instantiate' do
        it 'exists' do
            expect(@exhibit).to be_an_instance_of Exhibit
        end
    end
end