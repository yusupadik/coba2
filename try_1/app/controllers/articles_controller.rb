class ArticlesController < ApplicationController
  before_filter :find_article, :only => [:show, :edit, :update, :destroy]
  #before_filter :your_article, :only => [ :edit, :destroy]
  before_filter :require_login, :only => [:new, :create, :edit, :update, :delete]

  def index
    @articles = Article.all
  end
  
  def new
     @article =Article.new
  end
  
  def show
 
     @article = Article.find_by_id(params[:id])   
     @comments = @article.comments
     @comment = @article.comments.new
  end
  
  def create
    @article =Article.new(params[:article])
    
    @article.save
    if @article.save
      flash[:notice] = 'Article was successfully created.'
      redirect_to articles_path
    else
      flash[:error] = 'Article was failed to create.'
      render :new
    end
 
  end
  
  def edit
    @article = Article.find_by_id(params[:id])
    
  end
  
  def update
    @article = Article.find_by_id(params[:id])

    if @article.update_attributes(params[:article])
       flash[:notice] = 'Article was successfully updated.'
       redirect_to articles_path
    else
      flash[:error] = 'Article was failed to updated.'
      render :edit
    end
  end
  
  def destroy
    @article = Article.find_by_id(params[:id])
    @article.destroy
    
    redirect_to articles_path
  end
  
  private
    def find_article
       if Article.find_by_id(params[:id]).nil? 
        flash[:error] = 'Article was not found.'
        redirect_to articles_path
      end
    end
    
   # def your_article
    # user = User.find_by_email(current_user.email)
     # unless @article.user_id == user.id
      #  flash[:notice] = " It's not your article !!!"
       # redirect_to articles_path
      #end
    #end 
end
