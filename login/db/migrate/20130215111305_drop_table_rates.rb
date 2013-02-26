class DropTableRates < ActiveRecord::Migration
  def up
  	drop_table :rates
  end

end
