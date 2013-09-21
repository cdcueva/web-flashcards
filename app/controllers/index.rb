# enable :sessions

#_______GET________#

get '/' do
    # @round = leader board
    erb :index
end

get '/sign_up' do
  erb :sign_up
end

get '/profile/:id' do
  @user = User.find(params[:id])
  round = @user.rounds.first # change first to go thru all rounds
  @stats = {}
  game = round.deck.name
  @stats[:game_name] = game
  correct_ques = round.guesses.where(:correct => true).count
  num_of_ques = round.guesses.size
  @stats[:correct_ques] = correct_ques
  @stats[:number_of_questions] = num_of_ques
  @stats[:perc] = ((correct_ques.to_f)/(num_of_ques))*100
  erb :profile
end

get '/home' do
  @deck = Deck.all
  erb :home
end

get '/round/:deck_id' do
  @deck = Deck.find(params[:deck_id]) 
  cards = Deck.find(params[:deck_id]).cards
  @card = cards.sample
  round = Round.create(user_id: session[:id], deck_id: params[:deck_id])
  session[:round] = round.id
  erb :card  
end

get '/logout' do
  session.clear
  redirect '/'
end

#_______POST________#

post '/home' do
  
  if params[:user][:email] != '' && params[:user][:password] != ''
    user = User.authenticate(params[:user][:email], params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect '/home'
    end
  else
    # @error = "Invalid email or password"
    erb :index
    redirect '/'
  end

end

post '/sign_up' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/home')
  else
    @errors = @user.errors
    erb :index
  end
end
