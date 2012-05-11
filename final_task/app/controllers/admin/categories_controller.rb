class Admin::CategoriesController < Admin::ApplicationController
  before_filter :require_admin_login
  
  def index
    @categories= Category.all
  end
  
  def new
    @category= Category.new 
    @parent_category = Category.where(["parent_id IS NULL"]).map{|x| [x.name, x.id ]}
  end
  
  def create
    @category= Category.new(params[:category])
    if @category.save
      flash[:notice] = 'Article was successfully created.'
      redirect_to admin_categories_path
    else
      flash[:error] = 'Article was failed to create.'
      render :new
    end
  end
  
  def edit
    @category = Category.find_by_id(params[:id])
    @parent_category = Category.where(["parent_id IS NULL"]).map{|x| [x.name, x.id ]}
  end
  
  def update
    @category = Category.find_by_id(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Category was successfully updated"
      redirect_to admin_categories_path
    else
      flash[:error] = "Category was failed to update"
      render :edit
    end
  end
  
  def destroy
   @category = Category.find_by_id(params[:id])
    puts @category.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to admin_categories_path
  end
  
end
