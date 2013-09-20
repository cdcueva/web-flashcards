############GET#############

get '/deck/:deck_id/card/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])
  erb :game
end


get '/deck/:id' do
  @deck = Deck.find(params[:id])
  cards = @deck.cards

  @card = cards.sample

  redirect to "/deck/#{params[:id]}/card/#{@card.id}"
   
end










############POST############


post '/guess/:id' do
  guess = params[:guess]
  card = Card.find(params[:id])

  if guess == card.answer
    @message = "That is correct!"
  else
    @message = "Sorry. The answer is #{card.answer}"
  end

  redirect to ('/deck/')

end

