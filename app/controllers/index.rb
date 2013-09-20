enable :sessions

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

  # @email = params[:email]
  # user = User.authenticate(@email, params[:password])
  # if user
  #   # successfully authenticated; set up session and redirect
  #   session[:user_id] = user.id
  #   redirect '/'
  # else
  #   # an error occurred, re-render the sign-in form, displaying an error
  #   @error = "Invalid email or password."
  #   erb :sign_in
  # end


  if User.find_by_email(params[:user][:email])
    @user ||= User.find_by_email(params[:user][:email])
    
    p session[:user_id] = @user.id   
  else
    @user = User.create(params[:user])
    p session[:user_id] = @user.id
  end
  @deck = Deck.all
  erb :home

end
