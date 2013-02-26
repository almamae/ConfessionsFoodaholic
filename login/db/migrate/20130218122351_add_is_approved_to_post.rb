class AddIsApprovedToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :isApproved, :integer
  end
end
