class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to @comment.playdate, :notice => 'Comment successfully created.' 
      
    else
      redirect_to @comment.playdate, :notice => 'Problem creating comment.' 
      
    end
    
  end
  
end