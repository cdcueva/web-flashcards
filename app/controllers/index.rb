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
  @stats = []
  @user = User.find(params[:id])
  rounds = @user.rounds 
  
  rounds.each do |round|
    stat = {}
    stat[:name] = round.deck.name
    stat[:correct] = round.guesses.where(correct: true).count
    stat[:total] = round.guesses.size
    stat[:perc] = (stat[:correct].to_f/stat[:total])*100
    @stats << stat 
  end
   
  @total = {}
  @total[:correct] = @stats.map{|x| x[:correct]}.reduce(:+)
  @total[:total] = @stats.map{|x| x[:total]}.reduce(:+)
  @total[:perc] = (@total[:correct].to_f/@total[:total] * 100).round(1)

  erb :profile
end

get '/home' do
  @deck = Deck.all
  erb :home
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
    # erb :index
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
