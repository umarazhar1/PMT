class RenameArticleCategoryToProjectCategory < ActiveRecord::Migration[7.0]
  def change
    rename_table :article_categories, :project_categories
  end
end
