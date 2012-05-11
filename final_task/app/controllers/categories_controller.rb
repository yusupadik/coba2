class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @parent= Category.parent
  end
  
  def show
    @products = Product.find_all_by_category_id(params[:id])
  end
  

end
