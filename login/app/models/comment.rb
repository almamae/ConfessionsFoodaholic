class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :commentable_type, :commentable_id
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  
  def post
    return @post if defined?(@post)
    @post = commentable.is_a?(Post) ? commentable : commentable.post
  end
end
