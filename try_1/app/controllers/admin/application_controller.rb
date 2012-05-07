class Admin::ApplicationController < ApplicationController
  protect_from_forgery
  helper_method :current_user
  rescue_from NoMethodError, :with => :record_not_found

  def require_admin_login
    if current_user.nil? || !current_user.is_admin?
      flash[:error] = "Only admins are permitted"
      redirect_to log_in_path
    else
      return current_user
    end
  end
  
  private
   def record_not_found
    render "/public/500.html", :status => 500, :layout => false
  end

  
  
end
