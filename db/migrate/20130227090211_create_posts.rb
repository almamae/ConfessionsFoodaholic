class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :category
      t.integer :isApproved, default:0
      t.string :caption
      t.string :file_name
      t.string :file_type
      t.binary :data, limit: 6.megabyte

      t.timestamps
    end
  end
end
