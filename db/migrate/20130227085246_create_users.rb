class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :fname
      t.string :lname
      t.string :mname
      t.string :password_hash
      t.string :password_salt
      t.string :occupation
      t.string :province
      t.string :city
      t.string :isConfirmed
      t.string :twitter
      t.string :facebook
      t.string :g_plus
      t.integer :isBanned, default:0 
      t.integer :isReported, default:0 
      t.datetime :dateReported
      t.string :user_type, default:"unconfirmed member"
      t.string :confirmation_code
      t.timestamps
    end
  end
end
