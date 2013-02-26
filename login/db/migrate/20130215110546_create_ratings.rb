class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :value

      t.timestamps
    end
  end

  def self.down
  	drop_table :rates
  end
end
