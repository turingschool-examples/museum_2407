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

    def patrons_by_exhibit_interest
        exhibits.zip(patrons).to_h
    end

    def ticket_lottery_contestants(exhibit)
        contestants = []
        @patrons.each do |patron|
            if patron.spending_money < exhibit.cost && patron.interests.include?(exhibit.name)
             contestants << patron
            end
        end
        p contestants
    end

    def draw_lottery_winner(exhibit)
        contestants = ticket_lottery_contestants(exhibit)
        return nil if contestants.empty?
        contestants.sample  
    end
end
