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
        matching_interests = []
        patron.interests.each do |interest|

            if @museum.exhibits.include?(interest)
            matching_interests << 
        end
        p matching_interests
    end
end