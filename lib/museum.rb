class Museum
    attr_reader :name, :exhibits, :patrons

    def initialize(name)
        @name = name
        @exhibits = []
        @patrons = []
    end

    def add_exhibit(exhibit)
        @exhibits << exhibit
    end

    def recommend_exhibits(patron)
        matching_interests = []
        @exhibits.each do |exhibit|
           if patron.interests.include?(exhibit.name)
                matching_interests << exhibit
           end
        end
        p matching_interests
    end

    def admit(patron)
        @patrons << patron
    end
end