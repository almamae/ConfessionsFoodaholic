class CommentsController < ApplicationController
  before_filter :get_parent, :authorize

  def new
    @parent_comment = Comment.find_by_id(params[:comment_id])
    @comment =  @parent.comments.build(params[:comment]) 
  end

  def create
    @comment = @parent.comments.build(params[:comment])

    if @comment.save
      redirect_to post_path(Post.find(@comment.post)), :notice => 'Comment saved!'
    else
      redirect_to post_path(Post.find(@comment.post)), :notice => 'Comment not saved!'
    end
  end
  
  protected
  
  def get_parent
    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
  end

end
