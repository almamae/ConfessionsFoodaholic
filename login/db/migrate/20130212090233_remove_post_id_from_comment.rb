class RemovePostIdFromComment < ActiveRecord::Migration
  def up
  	remove_column	:comments, :post_id
  end

  def down
  end
end
