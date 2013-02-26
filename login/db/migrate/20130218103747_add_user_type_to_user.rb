class AddUserTypeToUser < ActiveRecord::Migration
  def change
  	add_column	:users, :user_type, :string
  	add_column  :users, :g_plus, :string
  end
end
