class AddColumnToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :recipe_id, :integer
  	add_column :posts, :category, :string
  end
end
