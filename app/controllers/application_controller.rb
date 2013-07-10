class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user = User.find_by_token(session[:token])
  end
end
