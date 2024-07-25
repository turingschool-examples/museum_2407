class Patron
    attr_reader :name,
                :money_spent,
                :interests

    def initialize(name, money_spent)
        @name = name
        @money_spent = money_spent
        @interests = []
    end

    def add_interest(interest)
        @interests << interest
    end
end