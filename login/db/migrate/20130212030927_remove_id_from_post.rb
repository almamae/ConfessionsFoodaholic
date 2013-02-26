class RemoveIdFromPost < ActiveRecord::Migration
  def up
	remove_column :posts, :userId  
  end

end
