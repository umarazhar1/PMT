class RenameProjectCategoryToBugProject < ActiveRecord::Migration[7.0]
  def change
    rename_table :project_categories, :bug_projects
  end
end
