class CommentsController < ApplicationController

  def create
    @playdate = Playdate.find(params[:playdate_id])
    @comment = @playdate.comments.new(params[:comment])
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to @comment.playdate, :notice => 'Comment successfully created.' 
      
    else
      redirect_to @comment.playdate, :notice => 'Problem creating comment.' 
      
    end
    
  end
  
  def destroy
     @comment = Comment.find(params[:id])
      @comment.destroy
      
      redirect_to "/admin/comments", :notice => "Comment Deleted"
  end
  
end