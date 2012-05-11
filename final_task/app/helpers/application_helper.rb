module ApplicationHelper
   def welcome_text
    str = "" #jika user telah login, tampilkan welcome textnya
    if current_user
      str = "Welcome, #{current_user.name}  "
    end
  
  end 

end
