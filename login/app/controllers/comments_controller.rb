  class CommentsController < ApplicationController
  
  before_filter :get_parent, :authorize

  def new
    @comment =  @parent.comments.build(params[:comment]) 
  end

  def create
    @comment = @parent.comments.build(params[:comment])

    if @comment.save
      redirect_to post_path(Post.find(@comment.post)), :notice => 'Thank you for your comment!'
    else
      render :new
    end
  end
  
  protected
  
  def get_parent
    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
  end

end
