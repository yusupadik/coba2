class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    redirect_to :controller => :articles, :action => :show
    
  end
  
  def create
    @comment =Comment.new(params[:comment])
    
    @comment.save
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to articles_path
    else
      flash[:error] = 'Comment was failed to create.'
      render :new
    end
 
  end


end
