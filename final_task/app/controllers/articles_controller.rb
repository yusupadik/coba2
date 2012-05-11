class ArticlesController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :edit, :update, :delete]
  before_filter :find_article, :only => [:show, :edit, :update, :destroy]
  before_filter :your_article, :only => [ :edit, :destroy]
 
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
        
  end
  
  def update
    if @article.update_attributes(params[:article])
       flash[:notice] = 'Article was successfully updated.'
       redirect_to articles_path
    else
      flash[:error] = 'Article was failed to updated.'
      render :edit
    end
  end
  
  def destroy
    @article.destroy
    
    redirect_to articles_path
  end
  
  private
    def find_article
       @article = Article.find_by_id(params[:id])
       if @article.nil? 
        flash[:error] = 'Article was not found.'
        redirect_to articles_path
      end
    end
    
   def your_article
     unless current_user.is_admin?
       user = User.find_by_email(current_user.email)
       unless @article.user_id == user.id
         flash[:notice] = " It's not your article !!!"
         redirect_to articles_path
        end
     end
   end   
end
