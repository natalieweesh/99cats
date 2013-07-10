class UsersController < ApplicationController

  def index
    @token = session[:token]
    @user = User.find_by_token(session[:token])

    if @token && @user
      render :text => "Welcome #{@user.username}!"
    else
      redirect_to new_session_url
    end
  end

  def new
    render :new
  end

  def show
    @token = session[:token]
    @me = User.find_by_token(@token)

    if @token
      @user_page = User.find_by_id(params[:id])
      if not @user_page
        render :text => "No such user!"
      elsif @me != @user_page
        render :text => "This is #{@user_page.username}'s page!"
      else
        redirect_to users_url
      end
    else
      redirect_to new_session_url
    end
  end

  def create
    @user = User.new(params[:user])
    @token = SecureRandom::urlsafe_base64(16)
    @user.token = @token

    if @user.save
      session[:token] = @token
      redirect_to user_url(@user.id)
    else
      render :back
    end
  end
end
