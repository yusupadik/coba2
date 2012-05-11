class Admin::ApplicationController < ApplicationController
  protect_from_forgery

  def require_admin_login
     if current_user.nil? || !current_user.iss_admin
       flash[:error] = "Only admins are permitted"
       redirect_to root_path
    else
       
       return current_user
    end
  end
  
end
