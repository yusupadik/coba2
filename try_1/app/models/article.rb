class Article < ActiveRecord::Base
 has_many :comments
 
 belongs_to :user
 
 scope :rating_is_and_above, lambda{|rate| where("rating >= ?", rate) } 
 
 validates :title, :presence => true,
                   :uniqueness => true



end
