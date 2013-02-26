class AddValueToRates < ActiveRecord::Migration
  def change
  	add_column :rates, :value, :integer
  end
end
