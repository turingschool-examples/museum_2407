class Exhibit
    attr_reader :name, :cost

    def initialize(exhibit)
        @name = exhibit[:name]
        @cost = exhibit[:cost]
    end
end