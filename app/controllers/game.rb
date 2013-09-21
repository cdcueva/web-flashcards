############GET#############

get '/deck/:id' do
  deck = current_user.decks << Deck.find(params[:id])
  round = current_user.rounds.last

  redirect to "/round/#{round.id}"
end

get '/round/:id' do
  round = Round.find(params[:id])
  card = round.deck.cards.sample
  
  if card.guesses.empty?
    card
  elsif card.guesses.last.correct
    redirect to "/round/#{params[:id]}"
  else
    card
  end

  redirect to "/round/#{round.id}/card/#{card.id}"
end


get '/round/:round_id/card/:card_id' do
  @round = Round.find(params[:round_id])
  @deck = Deck.find(@round.deck_id)
  @card = Card.find(params[:card_id])
  if Guess.last.correct
    @message = "Correct! The answer was \"#{Card.find(Guess.last.card_id).answer}\""
  else
    @message = "Incorrect! The answer was \"#{Card.find(Guess.last.card_id).answer}\""
  end

  erb :game
end


############POST############


post '/round/:round_id/card/:card_id' do
  guess = params[:guess]
  @card = Card.find(params[:card_id])
  @round = Round.find(params[:round_id])

  if guess == @card.answer
    Guess.create(correct: true, card_id: params[:card_id],round_id: params[:round_id])
  else
    Guess.create(correct: false, card_id: params[:card_id],round_id: params[:round_id])
  end

  redirect to "/round/#{@round.id}"

end

