class AddUserIdToLike < ActiveRecord::Migration
  def change
  	add_column :rates, :user_id, :integer
  end
end
