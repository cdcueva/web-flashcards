require 'csv'

# deck1 = Deck.create!(:name => "Programming")


# CSV.foreach('cards0.csv') do |row|
#   deck1.cards << Card.create!(:question => row[1], :answer => row[0])
# end


# deck2 = Deck.create!(:name => "Nighthawks")


# CSV.foreach('nighthawks.csv') do |row|
#   deck2.cards << Card.create!(:question => row[1], :answer => row[0])
# end

deck3 = Deck.create!(:name => "Looney Tunes Characters")
card_array = [{:question => "/images/21.GIF", :answer => "Bugs Bunny"},
							{:question => "/images/22.GIF",:answer => "Barnyard Dawg"},
							{:question => "/images/23.GIF",:answer => "Beaky Buzzard"},
							{:question => "/images/24.GIF",:answer => "Daffy Duck"},
							{:question => "/images/25.jpg",:answer => "Elmer Fudd"},
							{:question => "/images/26.GIF",:answer => "Foghorn Leghorn"},
							{:question => "/images/27.GIF",:answer => "Marvin Martian"},
							{:question => "/images/28.GIF",:answer => "Pepe Le Pew"},
							{:question => "/images/29.GIF",:answer => "Porky Pig"},
							{:question => "/images/30.GIF",:answer => "Yosemite Sam"}]

card_array.each do |card_hash|
	deck3.cards << Card.create!(card_hash)
end

deck4 = Deck.create!(:name => "World Flags")
card_array = [{:question => "/images/1.GIF", :answer => "Afghanistan"},
							{:question => "/images/2.GIF", :answer => "Netherlands"},
							{:question => "/images/3.GIF", :answer => "Norway"},
							{:question => "/images/4.GIF", :answer => "South Africa"},
							{:question => "/images/5.GIF", :answer => "Zimbabwe"},
							{:question => "/images/6.GIF", :answer => "Pakistan"},
							{:question => "/images/7.GIF", :answer => "Argentina"},
							{:question => "/images/8.GIF", :answer => "Malaysia"},
							{:question => "/images/9.GIF", :answer => "Romania"},
							{:question => "/images/10.GIF", :answer => "Ecuador"}]

card_array.each do |card_hash|
	deck4.cards << Card.create!(card_hash)
end

deck5 = Deck.create!(:name => "Two-Handed Sign Language Alphabet")

card_array = [{:question => "/images/11.GIF", :answer => "A"},
							{:question => "/images/12.GIF", :answer => "B"},
							{:question => "/images/13.GIF", :answer => "D"},
							{:question => "/images/14.GIF", :answer => "E"},
							{:question => "/images/15.GIF", :answer => "F"},
							{:question => "/images/16.GIF", :answer => "G"},
							{:question => "/images/17.GIF", :answer => "H"},
							{:question => "/images/18.GIF", :answer => "I"},
							{:question => "/images/19.GIF", :answer => "J"},
							{:question => "/images/20.GIF", :answer => "K"}]

card_array.each do |card_hash|
	deck5.cards << Card.create!(card_hash)
end


# i = 1
# 10.times do |i|
#   Guess.create(card_id: i, round_id: 2, correct: ([0,1].sample))
#   i += 1
# end
