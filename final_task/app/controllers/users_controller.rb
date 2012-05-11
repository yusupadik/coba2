class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if verify_recaptcha
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        flash[:notice] = "Sign up!"
        redirect_to root_path 
      else
        flash[:error] = "Error"
        render "new"
      end
    else
      flash[:error] = "Your Recaptcha is wrong"
      render "new"
    end
  end
  
  def show
    @user= User.find_by_id(current_user.id)
  end
  
  def edit
    @user = User.find_by_id(current_user.id)     
  end
  
  def update
    @user = User.find_by_id(params[:id])     
    if @user.update_attributes(params[:user])
       flash[:notice] = 'Article was successfully updated.'
       redirect_to user_path(current_user.id)
    else
      flash[:error] = 'Article was failed to updated.'
      render :edit
    end
  end
   
end
