#_______GET________#

get '/' do
  # Look in app/views/index.erb
  erb :index
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
  if User.find_by_email(params[:user][:email])
    @user ||= User.find_by_email(params[:user][:email])   
  else
    @user = User.create(params[:user])
  end
erb :home
end
