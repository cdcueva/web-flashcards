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
card_array = [{:question => "http://toolooney.goldenagecartoons.com/mckimsonbugsyell.gif", :answer => "Bugs Bunny"},
							{:question => "http://toolooney.goldenagecartoons.com/dawgclip.gif",:answer => "Barnyard Dawg"},
							{:question => "http://toolooney.goldenagecartoons.com/beakyclip.gif",:answer => "Beaky Buzzard"},
							{:question => "http://toolooney.goldenagecartoons.com/daffymarch.gif",:answer => "Daffy Duck"},
							{:question => "http://toolooney.goldenagecartoons.com/elmerclipart.jpg",:answer => "Elmer Fudd"},
							{:question => "http://toolooney.goldenagecartoons.com/foglistenclip.gif",:answer => "Foghorn Leghorn"},
							{:question => "http://toolooney.goldenagecartoons.com/marvinclipart2.gif",:answer => "Marvin Martian"},
							{:question => "http://toolooney.goldenagecartoons.com/pepepointclip.gif",:answer => "Pepe Le Pew"},
							{:question => "http://toolooney.goldenagecartoons.com/prokywaveclip.gif",:answer => "Porky Pig"},
							{:question => "http://toolooney.goldenagecartoons.com/sambia.gif",:answer => "Yosemite Sam"}]

card_array.each do |card_hash|
	deck3.cards << Card.create!(card_hash)
end

deck4 = Deck.create!(:name => "World Flags")
card_array = [{:question => "http://www.flags.net/images/largeflags/AFGH0001.GIF", :answer => "Afghanistan"},
							{:question => "http://www.flags.net/images/largeflags/NETH0001.GIF", :answer => "Netherlands"},
							{:question => "http://www.flags.net/images/largeflags/NORW0001.GIF", :answer => "Norway"},
							{:question => "http://www.flags.net/images/largeflags/SOAF0001.GIF", :answer => "South Africa"},
							{:question => "http://www.flags.net/images/largeflags/ZBWE0001.GIF", :answer => "Zimbabwe"},
							{:question => "http://www.flags.net/images/largeflags/PAKS0001.GIF", :answer => "Pakistan"},
							{:question => "http://www.flags.net/images/largeflags/ARGE0001.GIF", :answer => "Argentina"},
							{:question => "http://www.flags.net/images/largeflags/MALS0001.GIF", :answer => "Malaysia"},
							{:question => "http://www.flags.net/images/largeflags/RMNA0001.GIF", :answer => "Romania"},
							{:question => "http://www.flags.net/images/largeflags/ECUA0001.GIF", :answer => "Ecuador"}]

card_array.each do |card_hash|
	deck4.cards << Card.create!(card_hash)
end

deck5 = Deck.create!(:name => "Two-Handed Sign Language Alphabet")

card_array = [{:question => "http://etc.usf.edu/clipart/21200/21204/a_21204_sm.gif", :answer => "A"}]
							# {:question => "", :answer => ""},
							# {:question => "", :answer => ""},
							# {:question => "", :answer => ""},
							# {:question => "", :answer => ""},
							# {:question => "", :answer => ""},
							# {:question => "", :answer => ""},
							# {:question => "", :answer => ""},
							# {:question => "", :answer => ""},
							# {:question => "", :answer => ""},
# ]




# i = 1
# 10.times do |i|
#   Guess.create(card_id: i, round_id: 2, correct: ([0,1].sample))
#   i += 1
# end
