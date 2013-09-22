# enable :sessions

#_______GET________#

get '/' do
    round = Round.all

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
    stat[:date] = round.created_at.strftime("%m-%d-%Y %I:%M%p")
    stat[:name] = round.deck.name
    stat[:correct] = round.guesses.where(correct: true).count
    stat[:total] = round.guesses.size
    if ((stat[:correct].to_f/stat[:total])*100).nan?
      stat[:perc] = 0.0
    else
      stat[:perc] = (stat[:correct].to_f/stat[:total])*100
    end
    @stats << stat 
  end
   
  if !@stats.empty? 
    @total = {}
    @total[:game] = rounds.count
    @total[:correct] = @stats.map{|x| x[:correct]}.reduce(:+)
    @total[:total] = @stats.map{|x| x[:total]}.reduce(:+)
    @total[:perc] = (@total[:correct].to_f/@total[:total] * 100).round(1)
  end
  
  erb :profile
end

get '/play_again/:round_id' do
  deck_id = Round.find(params[:round_id]).deck_id
  redirect to "/deck/#{deck_id}"
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
    if user != nil
      session[:user_id] = user.id
      redirect '/home'
    else
      redirect '/'
    end

  else
    redirect '/'
  end

end

post '/sign_up' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/home'
  else
    @errors = user.errors
    erb :sign_up
  end
end
