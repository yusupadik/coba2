class HomesController < ApplicationController

  def index
    @products= Product.last(6).reverse
    @articles= Article.last(3).reverse
  end
  
end
