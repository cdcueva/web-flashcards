############GET#############

get '/deck/:id' do
  deck = current_user.decks << Deck.find(params[:id])
  round = current_user.rounds.last

  redirect to "/round/#{round.id}"
end

get '/round/:id' do
  @round = Round.find(params[:id])
  card = @round.deck.cards.sample
  
  false_guesses = []
  @round.guesses.each do |guess|
    false_guesses << guess.correct if guess.correct == false
  end

  if @round.guesses.count == Deck.find(@round.deck_id).cards.count || false_guesses.count == 3
    redirect to "/round/#{@round.id}/summary"
  end

  if @round.guesses.find_by_card_id(card.id)
    redirect to "/round/#{params[:id]}"
  else
    card
  end

  redirect to "/round/#{@round.id}/card/#{card.id}"
end


get '/round/:round_id/card/:card_id' do
  @round = Round.find(params[:round_id])
  @deck = Deck.find(@round.deck_id)
  @card = Card.find(params[:card_id])
  @remaining_cards = @deck.cards.count
  @remaining_guesses = 3
  if @round.guesses.any?
    @remaining_cards = @deck.cards.count - @round.guesses.count
    
    false_guesses = []
    @round.guesses.each do |guess|
      false_guesses << guess.correct if guess.correct == false
    end

    @remaining_guesses = 3 - false_guesses.count if false_guesses.count

    if Guess.last.correct
      @message = "Correct! The answer was \"#{Card.find(Guess.last.card_id).answer}\""
    else
      @message = "Incorrect! The answer was \"#{Card.find(Guess.last.card_id).answer}\""
    end
  end

  erb :game
end

get '/round/:id/summary' do
  @round = Round.find(params[:id])
  erb :summary
end


############POST############ => 


post '/round/:round_id/card/:card_id' do
  guess = params[:guess]
  @card = Card.find(params[:card_id])
  @round = Round.find(params[:round_id])

  if guess.downcase == @card.answer.downcase
    Guess.create(correct: true, card_id: params[:card_id],round_id: params[:round_id])
  else
    Guess.create(correct: false, card_id: params[:card_id],round_id: params[:round_id])
  end

  redirect to "/round/#{@round.id}"

end

