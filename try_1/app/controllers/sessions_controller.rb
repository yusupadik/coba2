class SessionsController < ApplicationController
  
  def index
  end
  
  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Logged in / Login SUkses!"
      
      redirect_to sessions_path
    else
      flash.now.alert = "Invalid email or password" 
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to sessions_path 
  end  
  
end
