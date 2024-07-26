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

    def patrons_by_exhibit_interest
        output = Hash.new(0)
        patrons = ObjectSpace.each_object(Patron)
        @exhibits.each do|exhibit| 
            output[exhibit] = []
            patrons.each do |patron|
                if patron.interests.include?(exhibit)
                    output[exhibit].push(patron)
                end
            end
        end
        output
    end

    def ticket_lottery_contestants(exhibit)
        contestants_list = []
        patrons = ObjectSpace.each_object(Patron)
        patrons.each do |patron|
            if patron.interests.include?(exhibit) && 
                patron.money_spent < exhibit.cost 
                contestants_list << patron
            end
        end
        contestants_list
    end

    def draw_lottery_winner(exhibit)
        contestants_list = ticket_lottery_contestants(exhibit)
        rand_length  = ticket_lottery_contestants(exhibit).length
        contestants_list[rand(rand_length)]
    end
end