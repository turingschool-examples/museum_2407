class Patron
    attr_reader :name,
                :money_spent,
                :interests

    def initialize(name, money_spent)
        @name = name
        @money_spent = money_spent
        @interests = []
    end
end