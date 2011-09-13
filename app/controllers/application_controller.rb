class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def require_user
    unless current_user
      #unauthorized access
      return redirect_to root_path
    end
  end

  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end


end
