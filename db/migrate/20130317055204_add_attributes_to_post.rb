class AddAttributesToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :video_url, :string
  	add_column :posts, :content_type, :string
  end
end
