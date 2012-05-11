class Category < ActiveRecord::Base
  has_many :products,  :dependent => :destroy
  has_many :child_categories,
           :class_name => "Category",
           :foreign_key => "parent_id"
  
  belongs_to :parent_category,
             :class_name => "Category",
             :foreign_key => "parent_id"
  scope :parent_cat, where("parent_id is NULL ")
end
