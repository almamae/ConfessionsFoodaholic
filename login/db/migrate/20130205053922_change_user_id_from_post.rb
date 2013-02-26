class ChangeUserIdFromPost < ActiveRecord::Migration
  def up
  	change_column :posts, :userId, :user_id
  end

  def down
  end
end
