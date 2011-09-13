class SessionsController < ApplicationController
  
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_uid(auth["uid"])
    if user
      user.update_attributes!(:oauth_token => auth["credentials"]["token"], :oauth_secret => auth["credentials"]["secret"])
    else
      user = User.create_with_omniauth(auth)
    end
    
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

end
