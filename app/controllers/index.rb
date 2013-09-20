enable :sessions

#_______GET________#

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sign_up' do
  erb :sign_up
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


#_______POST________#

post '/home' do
  @user = User.authenticate(params[:user])
  
  if @user
    session[:id] = @user.id
    redirect to('/home')
  else
    erb :index
  end

end

post '/sign_up' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect to('/home')
  else
    @errors = @user.errors
    erb :index
  end
end
