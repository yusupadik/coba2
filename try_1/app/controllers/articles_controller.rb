class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end
  
  def new
     @article =Article.new
  end
  
  def show
     @article = Article.find_by_id(params[:id])
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

end
