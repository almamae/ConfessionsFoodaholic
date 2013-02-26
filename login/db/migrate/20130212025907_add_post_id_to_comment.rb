class AddPostIdToComment < ActiveRecord::Migration
  def self.up
	add_column :comments, :post_id, :integer
  end
end
