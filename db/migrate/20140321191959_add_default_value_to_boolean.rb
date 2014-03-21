class AddDefaultValueToBoolean < ActiveRecord::Migration
  def change
  	change_column_default(:articles, :is_draft, true)
  end
end
