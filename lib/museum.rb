class Museum
  attr_reader :name,
              :exhibits,
              :patrons, 
              :lottery_contestants
  
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @lottery_contestants = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select {|exhibit| patron.interests.include?(exhibit.name)}   
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
     hash = {}
     @exhibits.each do |exhibit|
     hash[exhibit] =  @patrons.select {|patron| patron.interests.include?(exhibit.name)}  
    end
    hash
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.select {|patron| patron.spending_money < exhibit.cost}
    # require 'pry'; binding.pry
  end

  def draw_lottery_winner(exhibit)
    ticket_lottery_contestants(exhibit).shuffle.first
  
 
  end

  def announce_lottery_winner(exhibit)
    return p "#{ticket_lottery_contestants(exhibit).shuffle.first.name} has won the #{exhibit.name} exhibit lottery"
    # require 'pry'; binding.pry
  end
end
