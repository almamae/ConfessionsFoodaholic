class AddColumnToComment < ActiveRecord::Migration
  def change
  	add_column :comments, :commentable_id, :integer 
  	add_column :comments, :commentable_type, :integer
  end
end
