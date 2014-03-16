class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :articles, :content, :text
  end
end