class Museum
    attr_reader :name, :exhibits, :patrons

    def initialize(name)
        @name = name
        @exhibits = []
        @patrons = []
    end

    def admit(patron)
        @patrons << patron
    end

    def add_exhibit(exhibit)
        @exhibits << exhibit
    end

    def recommend_exhibits(patron)
        recommended = []
        @exhibits.each do |exhibit|
            if patron.interests.include? exhibit.name
            recommended << exhibit
            end
        end
        recommended
    end

    def patrons_by_exhibit_interest
        patrons_by_exhibit_interest = {}
        @exhibits.each do |exhibit|
            patrons_by_exhibit_interest[exhibit] = interested_patrons(exhibit)
        end
        patrons_by_exhibit_interest
    end

    def interested_patrons(exhibit)
        @patrons.select do |patron|
            patron.interests.include?(exhibit.name)
        end
    end
end