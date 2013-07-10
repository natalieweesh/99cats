class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_username_and_password(
      params[:user][:username],
      params[:user][:password]
      )

    if @user
      @token = SecureRandom::urlsafe_base64(16)
      @user.update_attribute(:token, @token)

      session[:token] = @token
      redirect_to user_url(@user.id)
    else
      render :back
    end
  end
end
