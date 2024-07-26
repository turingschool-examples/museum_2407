class Museum
    attr_reader :name, :exhibits, :patrons

    def initialize(name)
        @name = name
        @exhibits = []
        @patrons = []
        @ticket_lottery_contestants = []
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

    def ticket_lottery_contestants(exhibit)
        patrons_in_lottery = []

        @patrons.each do |patron|
            if patron.interests.include?(exhibit.name) && patron.spending_money < exhibit.cost
                patrons_in_lottery << patron
            end
        end
     
        patrons_in_lottery
    end

    def draw_lottery_winner(exhibit)
        contestants = ticket_lottery_contestants(exhibit)
        winner = contestants.sample
        if winner
            winner.name
        else
            nil
        end
    end

end