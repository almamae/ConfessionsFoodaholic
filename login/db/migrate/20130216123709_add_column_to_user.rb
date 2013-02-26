class AddColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :occupation, :string
  	add_column :users, :twitter, :string
  	add_column :users, :facebook, :string
  	add_column :users, :isBanned, :integer
  	add_column :users, :isReported, :integer
  	add_column :users, :dateReported, :datetime
  end
end
