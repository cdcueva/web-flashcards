helpers do

  def current_user
    # @user = User.find(1)
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

end
