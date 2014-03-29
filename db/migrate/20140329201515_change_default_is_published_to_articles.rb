class ChangeDefaultIsPublishedToArticles < ActiveRecord::Migration
  def change
  	change_column_default :articles, :is_published, false
  end
end
