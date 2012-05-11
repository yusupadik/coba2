class ProductsController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :find_product, :only => [:show, :edit, :update, :destroy]
  before_filter :user_authentification, :only => [:edit, :update, :destroy]

  def index
    @products = Product.all
  end
  
  def new
    @product= Product.new
    @child_category = Category.where(["parent_id IS NOT NULL"]).map{|x| [x.name, x.id ]}
  end
  
  def create
    #@article = Article.new(params[:article])
    #@user = User.find_by_id(params[:article][:user_id])
    @user = User.find_by_email(current_user.email)
    @product = @user.products.create(params[:product])
    if @product.save
      flash[:notice] = "Product was successfully created"
      redirect_to products_path
    else
      flash[:error] = "Product was failed created"
      render :new
    end
  end
  
  def show
    #@product = Product.find(params[:id])
  end
  
  def edit
    @child_category = Category.where(["parent_id IS NOT NULL"]).map{|x| [x.name, x.id ]}
  end
  
  def update
    if @product.update_attributes(params[:product])
      flash[:notice] = "Article was successfully updated"
      redirect_to products_path
    else
      flash[:error] = "Article was failed to update"
      render :edit
    end
  end
  
  def destroy
    @product.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to products_path
  end
  
  private
  def find_product
    @product = Product.find_by_id(params[:id])
    if @product.nil?
      flash[:error] = "Article was not found"
      redirect_to products_path
    end
  end
  
  def user_authentification
    @product = Product.find_by_id(params[:id])
    user = User.find_by_email(current_user.email)
    unless @product.user_id == user.id || is_admin
      flash[:notice] = "Unauthorized user can't edit and delete Product"
      redirect_to products_path
    end
  end
 
end
