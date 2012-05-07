class Admin::ArticlesController < Admin::ApplicationController
  before_filter :require_admin_login
   before_filter :find_article, :only => [:show, :edit, :update, :destroy]

 
  def index
    @articles = Article.all
  end
  
  def new
     @article =Article.new
  end
  
  def show
     @comments = @article.comments
     @comment = @article.comments.new
  end
  
  def create
    @article.save
    if @article.save
      flash[:notice] = 'Article was successfully created.'
      redirect_to admin_articles_path
    else
      flash[:error] = 'Article was failed to create.'
      render :new
    end
 
  end
  
  def edit
    @article = Article.find_by_id(params[:id])
    
  end
  
  def update
    if @article.update_attributes(params[:article])
       flash[:notice] = 'Article was successfully updated.'
       redirect_to admin_articles_path
    else
      flash[:error] = 'Article was failed to updated.'
      render :edit
    end
  end
  
  def destroy
    @article.destroy
    
    redirect_to admin_articles_path
  end
  
  private
    def find_article
      @article = Article.find_by_id(params[:id])
       if @article.nil? 
        flash[:error] = 'Article was not found.'
        redirect_to admin_articles_path
      end
    end
  
end
