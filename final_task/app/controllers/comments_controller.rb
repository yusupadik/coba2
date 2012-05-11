class CommentsController < ApplicationController
def new
    @comment = Comment.new
    redirect_to :controller => :articles, :action => :show
    
  end
  
  def create
    @comment =Comment.new(params[:comment])
    @article = Article.find_by_id(params[:comment][:article_id])
    @comments = @article.comments
    respond_to do |format|
      @comment.save
      if @comment.save
        format.html { redirect_to(article_path(@comment.article_id), :notice => 'Comment was successfully created.') }
        format.js
      else
        flash[:error] = 'Comment was failed to create.'
        render :new
      end
    end 
  end
end
