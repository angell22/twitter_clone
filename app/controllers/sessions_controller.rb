class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def show
  end 

  def create
    @user = User.find_by(email: params[:user][:email])
    
    if @user && @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to tweets_url, notice: "Logged in successfully"
    else
      flash.now[:alert] = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
