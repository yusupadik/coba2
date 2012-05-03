class User < ActiveRecord::Base
  has_many :products
  has_many :articles
  has_many :shared_articles,
           :class_name => "Article",
           :foreign_key => "user_id",
           :conditions => "tile ='share'"
  has_one  :country
  
  def full_name
    "#{self.first_name} #{self.last_name} "
  end
  
  validates :firs_name, :presence => true,
                        :length => {:minimum =>1, :maximum => 20},
                        :format => {:with => /[a-zA-Z\s]+$/}

  validates :last_name, :presence => true,
                        :length => {:minimum =>1, :maximum => 20},
                        :format => {:with => /[a-zA-Z\s]+$/}

  validates :email, :presence => true,
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  
  validates :username, :presence => true,
                       :uniqueness => true

end
