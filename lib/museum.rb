class Museum
    attr_reader :name, :exhibits

    def initialize(name)
        @name = name
        @exhibits = []
    end

    def add_exhibit(exhibit)
        @exhibits << exhibit
    end

    def recommend_exhibits(patron)
        # look through the patrons interests
        # look at each interests
        # create an array with all of the exhibits that match interest
        require 'pry'; binding.pry
        
    end
end