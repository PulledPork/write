class ChangeDraftColNameToPublished < ActiveRecord::Migration
  def change
  	rename_column :articles, :is_draft, :is_published
  end
end
