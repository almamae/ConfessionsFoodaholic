class ChangeCommentableTypeFromComment < ActiveRecord::Migration
  def up
  	change_column :comments, :commentable_type, :string
  end


end
