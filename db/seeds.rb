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

card_array = [{:question => "http://etc.usf.edu/clipart/21200/21204/a_21204_sm.gif", :answer => "A"},
							{:question => "http://etc.usf.edu/clipart/21200/21248/b_21248_sm.gif", :answer => "B"},
							{:question => "http://etc.usf.edu/clipart/21200/21250/d_21250_sm.gif", :answer => "D"},
							{:question => "http://etc.usf.edu/clipart/21200/21251/e_21251_sm.gif", :answer => "E"},
							{:question => "http://etc.usf.edu/clipart/21200/21252/f_21252_sm.gif", :answer => "F"},
							{:question => "http://etc.usf.edu/clipart/21200/21253/g_21253_sm.gif", :answer => "G"},
							{:question => "http://etc.usf.edu/clipart/21200/21254/h_21254_sm.gif", :answer => "H"},
							{:question => "http://etc.usf.edu/clipart/21200/21255/i_21255_sm.gif", :answer => "I"},
							{:question => "http://etc.usf.edu/clipart/21200/21256/j_21256_sm.gif", :answer => "J"},
							{:question => "http://etc.usf.edu/clipart/21200/21257/k_21257_sm.gif", :answer => "K"}
]

card_array.each do |card_hash|
	deck5.cards << Card.create!(card_hash)
end


# i = 1
# 10.times do |i|
#   Guess.create(card_id: i, round_id: 2, correct: ([0,1].sample))
#   i += 1
# end
