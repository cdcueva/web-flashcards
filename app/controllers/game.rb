############GET#############

get '/deck/:deck_id/card/:card_id' do
  @round = current_user.rounds.last
  @deck = Deck.find(params[:deck_id])
  @card = @deck.cards.sample
  if @card.guesses.last.correct
    redirect to "/deck/#{@deck.id}/card/#{@card.id}"
  end

  erb :game
end


get '/deck/:id' do
  deck = current_user.decks << Deck.find(params[:id])

  redirect to "/deck/#{params[:id]}/card/0"
end




############POST############


post '/round/:round_id/card/:card_id' do
  guess = params[:guess]
  @card = Card.find(params[:card_id])
  @deck = Round.find(params[:round_id])

  if guess == @card.answer
    @message = "That is correct! Answer: #{@card.answer}"
    Guess.create(correct: true, card_id: params[:card_id],round_id: params[:round_id])
  else
    @message = "Sorry. The answer is #{@card.answer}"
    Guess.create(correct: false, card_id: params[:card_id],round_id: params[:round_id])
  end

  redirect to "/deck/#{@deck.id}/card/#{@card.id}"

end

