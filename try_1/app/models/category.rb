class Category < ActiveRecord::Base
   has_many :products, :through => :categories_products
   has_many :categories_products
end
