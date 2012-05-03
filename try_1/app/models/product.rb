class Product < ActiveRecord::Base
  has_many :categories, :through => :categories_products
  has_many :categories_products 
  
  belongs_to :user
  
  scope :price_more_than_1000, where("price > 1000")
end
