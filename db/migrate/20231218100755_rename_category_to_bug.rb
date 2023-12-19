class RenameCategoryToBug < ActiveRecord::Migration[7.0]
  def change
    rename_table :categories, :bugs

  end
end
