class Patron
    attr_reader :name,
                :money_spent

    def initialize(name, money_spent)
        @name = name
        @money_spent = money_spent
    end
end