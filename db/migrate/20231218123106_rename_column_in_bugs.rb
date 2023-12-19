class RenameColumnInBugs < ActiveRecord::Migration[7.0]
  def change
    rename_column :bugs, :name, :title
  end
end
