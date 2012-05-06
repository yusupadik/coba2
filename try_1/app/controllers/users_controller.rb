class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if verify_recaptcha
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        flash[:notice] = "Sign up!"
        redirect_to users_path 
      else
        render "new"
      end
    end
  end 
end
