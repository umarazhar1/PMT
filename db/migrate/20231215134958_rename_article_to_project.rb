class RenameArticleToProject < ActiveRecord::Migration[7.0]
  def change
    rename_table :articles, :projects
  end
end
