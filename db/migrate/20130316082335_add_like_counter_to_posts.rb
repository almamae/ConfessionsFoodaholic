class AddLikeCounterToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :like_counter, :integer, :default=>0
  end
end
