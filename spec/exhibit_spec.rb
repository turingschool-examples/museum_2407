require './lib/exhibit'

RSpec.describe Exhibit do


    it 'exists' do
        exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

        expect(exhibit).to be_an_instance_of Exhibit
    end

end