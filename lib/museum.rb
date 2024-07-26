class Museum
    attr_reader :name,
                :exhibits

    def initialize(name)
        @name = name
        @exhibits = []
    end

    def add_exhibit(exhibit)
        @exhibits << exhibit unless exhibit.class != Exhibit
    end

    def recommend_exhibits(patron) # <- REFACTOR
        if patron.class == Patron
            recommendations = []
            patron.interests.each do |interest|
                @exhibits.each do |exhibit|
                    if interest == exhibit.name
                        recommendations << exhibit
                    end
                end
            end
        else 
            return nil
        end
        recommendations
    end
end