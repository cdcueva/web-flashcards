require 'CSV'

# deck = Deck.create!(:name => "numbers")

# deck.cards = [array of all card objects]
# deck.cards << shovel things in here

# CSV.foreach('cards.csv') do |row|
#   deck.cards << Card.create!(:question => row[1], :answer => row[0])
# end


deck1 = Deck.create!(:name => "programming")


CSV.foreach('cards0.csv') do |row|
  deck1.cards << Card.create!(:question => row[1], :answer => row[0])
end


deck2 = Deck.create!(:name => "nighthawks")


CSV.foreach('nighthawks.csv') do |row|
  deck2.cards << Card.create!(:question => row[1], :answer => row[0])
end

# i = 1
# 10.times do |i|
#   Guess.create(card_id: i, round_id: 1, correct: ([0,1].sample))
#   i += 1
# end
