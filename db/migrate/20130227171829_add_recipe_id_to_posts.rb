class AddRecipeIdToPosts < ActiveRecord::Migration
  def change
  	add_column	:posts, :recipe_id, :integer
  end
end
