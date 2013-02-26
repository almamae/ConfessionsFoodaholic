class AddUserIdToPosts < ActiveRecord::Migration
  def self.up
	add_column :posts, :userId, :decimal
  end
end
